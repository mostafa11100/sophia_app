import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/getdata_formfirebase.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

class GetUserData {
  GetDataFromFirebase? firestore;
  SharedPref? pref;

  Future<Either<UserModel, ExeptionsFirebase>> get(uid) async {
    pref = SharedPref();
    Either<UserModel, ExeptionsFirebase>? data;
    UserModel? usermodel;
    firestore = GetDataFromFirebase();
    // String uid = await pref!.getfromshared("uid");
    Either<DocumentSnapshot<Map<String, dynamic>>, ExeptionsFirebase> result =
        await firestore!.getdocsdata("user", uid);

    result.fold((left) {
      usermodel = UserModel.fromjson(json: left.data()!, uid: left.id);
      data = Left(usermodel!);
    }, (right) {
      data = Right(right);
    });
    return data!;
  }
}
