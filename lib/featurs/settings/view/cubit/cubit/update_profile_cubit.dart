import 'dart:ffi';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/firebase_add_date.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/settings/data/models/modelof_update_user.dart';
import 'package:sophia_chat/featurs/settings/data/repo_updatestorage_firebase.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  SharedPref? pref;
  bool closee = false;
  RepoUpdatestorageFirebase? updatestorage;
  update({ModelUpdateProfile? modelofuserdata, File? file, url}) async {
    updatestorage = RepoUpdatestorageFirebase();
    pref = SharedPref();
    if (!closee) emit(UpdateProfileloading());
    String? downlowdurl;
    ModelUpdateProfile? modelupdate;
    pref = SharedPref();
    if (file != null) {
      String code = filecode(url);
      Either<ExeptionsFirebase, TaskSnapshot> rr =
          await updatestorage!.update(file: file, path: "images/$code");
      await rr.fold((left) {
        if (!closee) emit(UpdateProfilefail(left.eror!));
      }, (r) async {
        downlowdurl = await r.ref.getDownloadURL();

        modelupdate = ModelUpdateProfile.tojson(
            name: modelofuserdata!.name,
            email: modelofuserdata.email,
            location: modelofuserdata.location,
            phone: modelofuserdata.phone,
            description: modelofuserdata.description,
            url: downlowdurl);

        String uid = await pref!.getfromshared('uid');
        ExeptionsFirebase? result = await FirebaseAddDate.update(
            collection: "user", docs: uid, data: modelupdate!.json);
        if (result == null) {
          if (!closee) emit(UpdateProfilesuccess());
        } else {
          if (!closee) emit(UpdateProfilefail(result.eror!));
        }
      });
    } else {
      String uid = await pref!.getfromshared('uid');
      ExeptionsFirebase? result = await FirebaseAddDate.update(
          collection: "user", docs: uid, data: modelofuserdata!.json);
      if (result == null) {
        if (!closee) emit(UpdateProfilesuccess());
      } else {
        if (!closee) emit(UpdateProfilefail(result.eror!));
      }
    }
  }

  @override
  Future<void> close() {
    closee = true;
    // TODO: implement close
    return super.close();
  }
}

filecode(String url) {
  String re = "";
  int index = url.indexOf('%');
  for (int i = index + 3; i < url.length; i++) {
    if (url[i] == "?") break;
    re += url[i];
  }
  print("re========== $re");
  return re;
}
