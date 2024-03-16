import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';

abstract class RepoResetPassword {
  dynamic resetpassowrd(email);
}

class ResetpassowrdFirebase extends RepoResetPassword {
  FirebaseAuth? auth;
  @override
  dynamic resetpassowrd(email) async {
    try {
      auth = FirebaseAuth.instance;
      await auth?.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseException catch (e) {
      ExeptionsFirebase.fromejson(e.message);
    } catch (e) {
      ExeptionsFirebase.fromejson(e.toString());
    }
    return null;
  }
}
