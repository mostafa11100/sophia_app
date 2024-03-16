import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/auth/log_in/data/repos/abstract_login_repo.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this.log) : super(LogInInitial());
  LogInEmailAndPasswordRepo? log;
  SharedPref pref = SharedPref();
  void login(email, password) async {
    emit(LogInloading());

    Either<ExeptionsFirebase, UserCredential> result =
        await log!.login(email, password);
    result.fold((left) {
      emit(LogInfail(left.eror!, false));
    }, (right) {
      if (!FirebaseAuth.instance.currentUser!.emailVerified) {
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        emit(LogInfail(
            "sorry your acount need to verify please check your gemil and verify acount then try to login again",
            true));
      } else {
        pref.setinsharedbool("login", true);

        emit(LogInsucces(right));
      }
    });
  }
}
