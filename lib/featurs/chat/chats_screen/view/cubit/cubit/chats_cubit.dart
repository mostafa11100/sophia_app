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
  @override
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? stream1;
  GetFromFireStore getFromFireStore;
  SharedPref? pref;
  void getdata() async {
    // emit(Chatsloading());

    //اوسخ كود
    // Either<StreamSubscription<List<UserAndChatModel>>, ExeptionsFirebase>?
    //     result1 = await getFromFireStore.getdataandlisten(
    //         uid1: "jTfN06KUljT13n8wK75mkwPakGm1");

    // result1!.fold((left) {
    //   left.onData((data) {
    //     print("left = = = ${data.first.userModel!.name}");
    //     emit(Chatssuccess(data));
    //   });
    // }, (right) {
    //   print("eerroorr  ==  ${right.eror}");
    //   emit(Chatfail(right.eror!));
    // });

    stream1 = FirebaseFirestore.instance
        .collection("chats")
        .snapshots()
        .listen((event) async {
      pref = SharedPref();

      var uid = await pref!.getfromshared('uid');
      Either<List<UserAndChatModel>, ExeptionsFirebase>? result =
          await getFromFireStore.getdata(uid1: "jTfN06KUljT13n8wK75mkwPakGm1");

      result!.fold((left) {
        emit(ChatsInitial(left));
        emit(Chatssuccess(left));
      }, (right) {
        emit(Chatfail(right.eror!));
      });
    });
  }

  @override
  Future<void> close() {
    if (stream1 != null) {
      stream1!.cancel();
    }
    return super.close();
  }
}
