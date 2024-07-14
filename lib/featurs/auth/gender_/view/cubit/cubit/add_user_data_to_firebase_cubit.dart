// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/sendverify_emaik.dart';
import 'package:sophia_chat/featurs/auth/gender_/data/repos/repo_imp_adduser.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

part 'add_user_data_to_firebase_state.dart';

class AddUserDataToFirebaseCubit1 extends Cubit<AddUserDataToFirebaseState> {
  AddUserDataToFirebaseCubit1(this.repo_add)
      : super(AddUserDataToFirebaseInitial());
  RepoImpAddUserToFireBase? repo_add;
  SendverifyEmail? send = SendverifyEmail(FirebaseAuth.instance);
  void adduser({required UserModel? userModel}) async {
    print("before to user info sending   ${userModel!.jsonofmodel}");
    emit(AddUserDataToFirebaseloading());
    Either<bool, ExeptionsFirebase> result =
        await repo_add!.adduserinfo(usermodel: userModel);
    result.fold((left) async {
      print("left to user info sending");
      await send!.sendverifyemail();
      emit(AddUserDataToFirebasesuccess());
    }, (right) {
      print("right to user info ${right.eror}");
      emit(AddUserDataToFirebasefail(right.eror));
    });
  }
}
