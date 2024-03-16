import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';

class FirebaseFireStoreFunctions {
  FirebaseFirestore? db;
  Future<Either<bool, ExeptionsFirebase>> setdocs(
      {Map<String, dynamic>? json, String? colection, String? docs}) async {
    try {
      db = FirebaseFirestore.instance;
      db!.collection(colection!).doc(docs!).set(json!);
      return const Left(true);
    } on FirebaseException catch (e) {
      return Right(ExeptionsFirebase(e.toString()));
    } catch (e) {
      return Right(ExeptionsFirebase(e.toString()));
    }
  }
}
