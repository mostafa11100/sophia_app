import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/firebase_add_date.dart';
import 'package:sophia_chat/class/firebase_storage.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/list_ofstory.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/cubit/cubitaddstory/cubit_add_story_status.dart';
import 'package:sophia_chat/function/convert_temp_totime.dart';

class CubitAddStory extends Cubit<AddStoryStatus> {
  bool disbose = false;
  CubitAddStory() : super(AddStoryInital());
  FirebaseStorageOperations? storage;
  SharedPref? pref;
  add(File? file) async {
    try {
      pref = SharedPref();
      String uid = await pref!.getfromshared('uid');
      storage = FirebaseStorageOperations();
      Either<ExeptionsFirebase, TaskSnapshot> resultupload =
          await storage!.uploadfile('images/', file.hashCode.toString(), file);
      await resultupload.fold((left) {
        if (!disbose) emit(AddStoryFail(left.eror!));
      }, (right) async {
        String downlowdurl = await right.ref.getDownloadURL();
        ExeptionsFirebase? result = await FirebaseAddDate.updatedata(
            collection: "user",
            docs: uid,
            feild: "story",
            data: ListOfStorys.tojson(
                    caption: "",
                    story: downlowdurl,
                    timestmp: Timestamp.now(),
                    type: "image",
                    backgroundcolor: "0x33")
                .json);

        if (result == null) {
          if (disbose == false) {
            emit(AddStorySucces());
          }
        } else {
          if (!disbose) emit(AddStoryFail(result.eror!));
        }
      });

      //
    } catch (e) {
      if (!disbose) emit(AddStoryFail(e.toString()));
    }
  }

  @override
  Future<void> close() {
    disbose = true;

    return super.close();
  }
}
