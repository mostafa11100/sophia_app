import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/firebase_firestore.dart';
import 'package:sophia_chat/featurs/auth/gender_/data/repos/repo_abstract_add_collection_user.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

class RepoImpAddUserToFireBase extends RepoAbstractCollectionOfUser {
  @override
  Future<Either<bool, ExeptionsFirebase>> adduserinfo(
      {UserModel? usermodel}) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      FirebaseFireStoreFunctions db = FirebaseFireStoreFunctions();
      Either<bool, ExeptionsFirebase> result = await db.setdocs(
          colection: "user", docs: uid, json: usermodel!.jsonofmodel!);
      return result;
    } catch (e) {
      return Right(ExeptionsFirebase(e.toString()));
    }
  }
}
