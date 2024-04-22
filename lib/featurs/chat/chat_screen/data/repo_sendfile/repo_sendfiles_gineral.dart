import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gallery_picker/models/media_file.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/firebase_storage.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/repo_sendfile/abstractclass.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/repo_sendfile/repo_imp_sendimage_video.dart';

class SendFilesGineral extends AbstractSendFile {
  FirebaseStorageOperations? storage;
  @override
  Future<Either<List<resultmodel>, ExeptionsFirebase>> sendfile(
      {List<FileAndType>? data}) async {
    List<resultmodel> listofresults = [];
    try {
      storage = FirebaseStorageOperations();

      await Future.forEach(data!, (e) async {
        Either<ExeptionsFirebase, TaskSnapshot> result = await storage!
            .uploadfile("${e.type}/", "${e.file.hashCode}", e.file);

        listofresults.add(resultmodel(result, e.type));
      });
      return Left(listofresults);
    } catch (e) {
      return Right(ExeptionsFirebase.fromejson(e.toString()));
    }
  }
}

class FileAndType {
  File? file;
  String type;
  FileAndType(this.file, this.type);
}
