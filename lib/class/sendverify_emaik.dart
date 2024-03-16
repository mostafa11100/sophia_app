import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';

class SendverifyEmail {
  SendverifyEmail(this.auth);
  FirebaseAuth auth;
  Future<Either<bool, ExeptionsFirebase>> sendverifyemail() async {
    try {
      if (!auth.currentUser!.emailVerified) {
        await auth.currentUser!.sendEmailVerification();
        return const Left(true);
      } else {
        return const Left(false);
      }
    } catch (e) {
      return Right(ExeptionsFirebase.fromejson(e.toString()));
    }
  }
}
