// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/firebase_storage.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/repo_sendfile/abstractclass.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/custom_bottom_sheet.dart';

class sendimageorvideo extends AbstractSendFile {
  FirebaseStorageOperations? storage;
  @override
  Future<Either<List<resultmodel>, ExeptionsFirebase>> sendfile(
      {List<File>? data}) async {
    List<resultmodel> listofresults = [];
    try {
      storage = FirebaseStorageOperations();

      await Future.forEach(data!, (e) async {
        //  File file = await e.getFile();

        Either<ExeptionsFirebase, TaskSnapshot> result = await storage!
            .uploadfile("${FileType(e)}/", e.hashCode.toString(), e);

        listofresults.add(resultmodel(result, FileType(e)));
      });
      return Left(listofresults);
    } catch (e) {
      return Right(ExeptionsFirebase.fromejson(e.toString()));
    }
  }
}

class resultmodel {
  Either<ExeptionsFirebase, TaskSnapshot>? result;
  String? type;
  resultmodel(this.result, this.type);
}
