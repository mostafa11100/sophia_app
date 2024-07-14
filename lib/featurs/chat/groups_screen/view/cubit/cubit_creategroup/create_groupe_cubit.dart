import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/firebase_storage.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/data/models/group_model.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/data/repo_create_group.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/cubit/cubit_creategroup/create_groupe_state.dart';

class CreateGroupeCubit extends Cubit<CreateGrupeState> {
  CreateGroupeCubit() : super(CreateGroupeIntial());
  RepoCreateGroup? createGroup;
  SharedPref? pref;
  bool closee = false;
  FirebaseStorageOperations? storage;
  void create(GroupModelcreate model, File? file) async {
    if (!closee) {
      emit(CreateGroupeLoading());
      try {
        pref = SharedPref();
        String uid = await pref!.getfromshared('uid');
        storage = FirebaseStorageOperations();
        createGroup = RepoCreateGroup();
        if (file != null) {
          Either<ExeptionsFirebase, TaskSnapshot> resultupload = await storage!
              .uploadfile('images/', file.hashCode.toString(), file);
          await resultupload.fold((l) {
            emit(CreateGroupefail(l.eror!));
          }, (r) async {
            String url = await r.ref.getDownloadURL();

            ExeptionsFirebase? result = await createGroup!.adddata(
                GroupModelcreate.tojson(model.name, url, uid, model.admins,
                    model.members, model.settingmodel, []));
            if (result == null) {
              emit(CreateGroupeSucces());
            } else {
              emit(CreateGroupefail(result.eror!));
            }
          });
        } else {
          ExeptionsFirebase? result = await createGroup!.adddata(
              GroupModelcreate.tojson(model.name, "", uid, model.admins,
                  model.members, model.settingmodel, []));
          if (result == null) {
            emit(CreateGroupeSucces());
          } else {
            emit(CreateGroupefail(result.eror!));
          }
        }
      } catch (e) {
        emit(CreateGroupefail(ExeptionsFirebase.fromejson(e.toString()).eror!));
      }
    }
  }

  @override
  Future<void> close() {
    closee = true;
    return super.close();
  }
}
