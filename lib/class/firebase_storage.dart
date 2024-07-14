import 'package:either_dart/either.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';

class FirebaseStorageOperations {
  Reference? ref;
  Future<String?> deletefile({path}) async {
    try {
      ref = await FirebaseStorage.instance.ref().child(path);

      ref!.delete();
    } catch (e) {
      return e.toString();
    }
  }

  Future<Either<ExeptionsFirebase, TaskSnapshot>> uploadfile(
      parent, child, file) async {
    try {
      ref = FirebaseStorage.instance.ref().child(parent).child(child);
      TaskSnapshot result = await ref!.putFile(file);

      return Right(result);
    } on FirebaseException catch (e) {
      print(e.message);
      return Left(ExeptionsFirebase.fromejson(e.message));
    } catch (e) {
      print(e.toString());
      return Left(ExeptionsFirebase.fromejson(e.toString()));
    }
  }
}
