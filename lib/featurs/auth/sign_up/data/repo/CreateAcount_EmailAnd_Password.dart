// ignore: file_names

import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/featurs/auth/sign_up/data/repo/repo_abstract_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:either_dart/either.dart';

class CreateAcountEmailAndPassword extends RepoAbstractSignup {
  @override
  Future<Either<UserCredential, ExeptionsFirebase>> createacount(
      {String? email, String? passowrd}) async {
    try {
      UserCredential credintal = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: passowrd!);

      return Left(credintal);
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      return Right(ExeptionsFirebase.fromejson(e.message));
    } catch (e) {
      return Right(ExeptionsFirebase.fromejson(e.toString()));
    }
  }
}
