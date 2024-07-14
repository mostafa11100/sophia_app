import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/Repo/create_chate.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/Repo/getchat_fromfirebase.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/Repo/update_user.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/chat_model.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

part 'get_chat_state.dart';

class GetChatCubit extends Cubit<GetChatState> {
  GetChatCubit() : super(GetChatInitial());
  GetChatFromFireBase? db;
  ChatModel? chat;
  SharedPref? shared;
  CreateChate? createchate;
  UpdateUsers? adduser;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? res;
  void getchat(UserModel usermodel) async {
    adduser = UpdateUsers();
    createchate = CreateChate();
    db = GetChatFromFireBase();
    try {
      emit(GetChatlodaing());
      shared = SharedPref();
      String uid = await shared!.getfromshared('uid');

      if (checkifchatcreatedbefore(usermodel.listofuserchats!, uid)) {
        //getchat
        Either<StreamSubscription<QuerySnapshot<Map<String, dynamic>>>,
            ExeptionsFirebase> re = await db!.getdata(uid, usermodel.uid);

        re.fold((left) async {
          res = left;
          left.onData((data) async {
            String id = data.docs[0].id;
            chat = ChatModel.fromjson(data.docs[0].data());
            emit(GetChatsuccess(chat!, id));
          });
        }, (right) async {
          emit(GetChatfail(right.eror!));
        });
      } else {
        //create chate && add users to some
        //create chat uid1,uid2,messagges=0

        ExeptionsFirebase? creater = await createchate!
            .create(ModelofCreatechat.tojson([], uid, usermodel.uid).json);

        if (creater == null) {
          //addusers to some
          ExeptionsFirebase? ex = await adduser!.update(uid, usermodel.uid);
          if (ex == null) {
            Either<StreamSubscription<QuerySnapshot<Map<String, dynamic>>>,
                ExeptionsFirebase> re = await db!.getdata(uid, usermodel.uid);

            re.fold((left) async {
              res = left;

              left.onData((data) async {
                String id = data.docs[0].id;
                chat = ChatModel.fromjson(data.docs[0].data());

                emit(GetChatsuccess(chat!, id));
              });
            }, (right) async {
              emit(GetChatfail(right.eror!));
            });
          } else {
            emit(GetChatfail(ex.eror!));
          }
        } else {
          // error
          emit(GetChatfail(creater.eror!));
        }
      }
    } catch (e) {
      emit(GetChatfail(e.toString()));
    }
  }

  @override
  Future<void> close() {
    if (res != null) res!.cancel();
    return super.close();
  }
}

Future<
    Either<StreamSubscription<QuerySnapshot<Map<String, dynamic>>>,
        ExeptionsFirebase>> getdatafunc(
    GetChatFromFireBase? db, uid, uid2) async {
  Either<StreamSubscription<QuerySnapshot<Map<String, dynamic>>>,
      ExeptionsFirebase> re = await db!.getdata(uid, uid2);

  return re;
}

class ModelofCreatechat {
  String? uid1;
  String? uid2;
  List<Map> messages = [];
  Map<String, dynamic> json = {};
  ModelofCreatechat.tojson(this.messages, this.uid1, this.uid2) {
    json['message'] = messages;
    json['uid1'] = uid1;
    json['uid2'] = uid2;
  }
}

bool checkifchatcreatedbefore(List<dynamic> users, uid) {
  if (users.contains(uid)) {
    print("trrru");
    return true;
  } else {
    print("falllseee");
    return false;
  }
}
