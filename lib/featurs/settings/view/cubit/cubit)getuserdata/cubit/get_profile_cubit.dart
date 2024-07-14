import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit() : super(GetProfileInitial());
  FirebaseFirestore? db;
  SharedPref? pref;

  bool closee = false;

  getprofile() async {
    pref = SharedPref();

    try {
      emit(GetProfileloading()); //loading

      pref = SharedPref();
      String uid = await pref!.getfromshared('uid');
      db = FirebaseFirestore.instance;
      StreamSubscription<DocumentSnapshot<Map<String, dynamic>>> result =
          db!.collection("user").doc(uid).snapshots().listen((d) {
        if (!closee)
          emit(
              GetProfilesuccess(UserModel.fromjson(json: d.data()!, uid: uid)));
      });

      return Left(result);
    } on FirebaseException catch (e) {
      if (!closee)
        emit(GetProfilefail(ExeptionsFirebase.fromejson(e.message).eror!));
    } catch (e) {
      if (!closee)
        emit(GetProfilefail(ExeptionsFirebase.fromejson(e.toString()).eror!));
    }
  }

  @override
  Future<void> close() {
    closee = true;
    // TODO: implement close
    return super.close();
  }
}
