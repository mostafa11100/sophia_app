import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/Repo/getchat_fromfirebase.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/chat_model.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/repos/repo_imp_getfrom_firstore.dart';

part 'get_chat_state.dart';

class GetChatCubit extends Cubit<GetChatState> {
  GetChatCubit() : super(GetChatInitial());
  GetChatFromFireBase? db;
  ChatModel? chat;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? res;
  void getchat(uid2) async {
    db = GetChatFromFireBase();
    try {
      emit(GetChatlodaing());
      // SharedPref pref = SharedPref();
      //  String uid1 = await pref.getfromshared("uid1");

      Either<StreamSubscription<QuerySnapshot<Map<String, dynamic>>>,
              ExeptionsFirebase> re =
          await db!.getdata("jTfN06KUljT13n8wK75mkwPakGm1", uid2);

      re.fold((left) {
        res = left;

        left.onData((data) {
          String id = data.docs[0].id;
          chat = ChatModel.fromjson(data.docs[0].data());
          emit(GetChatsuccess(chat!, id));
        });
      }, (right) {
        emit(GetChatfail(right.eror!));
      });
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
