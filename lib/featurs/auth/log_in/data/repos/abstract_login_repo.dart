import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/log_in_email_and_password.dart';

abstract class LogInAbstract {
  Future<Either<Object, Object>> login(email, passowrd);
}

class LogInEmailAndPasswordRepo extends LogInAbstract {
  @override
  Future<Either<ExeptionsFirebase, UserCredential>> login(
      email, passowrd) async {
    try {
      LoginEmailAndpasswordInfirebase loginFirebase =
          LoginEmailAndpasswordInfirebase();
      var result = await loginFirebase.login(email, passowrd);
      return result;
    } catch (e) {
      return Left(ExeptionsFirebase.fromejson(e.toString()));
    }
  }
}
