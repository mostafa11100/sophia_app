import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';

class LoginEmailAndpasswordInfirebase {
  FirebaseAuth? auth;
  Future<Either<ExeptionsFirebase, UserCredential>> login(
      email, password) async {
    try {
      auth = FirebaseAuth.instance;
      UserCredential user = await auth!
          .signInWithEmailAndPassword(email: email, password: password);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return Left(ExeptionsFirebase.fromejson(e.message));
    } catch (e) {
      return Left(ExeptionsFirebase.fromejson(e.toString()));
    }
  }
}
