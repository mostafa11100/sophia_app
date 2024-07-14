import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/firebase_storage.dart';

class RepoUpdatestorageFirebase {
  Future<Either<ExeptionsFirebase, TaskSnapshot>> update(
      {File? file, path}) async {
    Either<ExeptionsFirebase, TaskSnapshot>? resultend;
    FirebaseStorageOperations storage = FirebaseStorageOperations();
    try {
      Either<ExeptionsFirebase, TaskSnapshot> result =
          await storage.uploadfile("images/", file.hashCode.toString(), file);
      await result.fold((left) async {
        resultend = Left(left);
      },
          await (right) async {
            String? delete = await storage.deletefile(path: path);
            if (delete == null) {
              resultend = Right(result.right);
            } else
              resultend = Left(ExeptionsFirebase.fromejson(delete));
          });
      return resultend!;
    } catch (e) {
      resultend = Left(ExeptionsFirebase.fromejson(e.toString()));

      return resultend!;
    }
  }
}
