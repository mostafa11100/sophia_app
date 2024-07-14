// ignore_for_file: await_only_futures

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_chat.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/repos/repo_imp_getfrom_firstore.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit({required this.getFromFireStore}) : super(ChatsInitial(null));

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? stream1;
  bool closecubit = false;
  GetFromFireStore getFromFireStore;
  SharedPref? pref;
  void getdata(bool refresh) async {
    if (!refresh) emit(Chatsloading());
    pref = SharedPref();
    String uid = await pref!.getfromshared('uid');

    Either<List<UserAndChatModel>, ExeptionsFirebase>? result =
        await getFromFireStore.getdata(uid1: uid);

    result!.fold((left) {
      // print("chat is done ${left[0].chatModel!.message}");
      if (closecubit == false) {
        emit(ChatsInitial(left));

        emit(Chatssuccess(left));
      }
    }, (right) {
      if (closecubit == false) {
        emit(Chatfail(right.eror!));
      }
    });
    //   });
  }

  @override
  Future<void> close() {
    if (stream1 != null) {
      stream1!.cancel();
    }
    closecubit = true;
    return super.close();
  }
}
