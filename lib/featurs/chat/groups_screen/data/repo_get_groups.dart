import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/getdata_formfirebase.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/data/models/group_model.dart';

class RepoGetGroups {
  GetDataFromFirebase? firestore;

  Future<Either<List<modelofgropandid>, ExeptionsFirebase>?> GetGroups(
      String uid) async {
    List<modelofgropandid> listofgrups = [];
    Either<List<modelofgropandid>, ExeptionsFirebase>? datareturn;
    firestore = GetDataFromFirebase();
    Either<QuerySnapshot<Map<String, dynamic>>, ExeptionsFirebase> result =
        await firestore!
            .getdata("groups", Filter("members", arrayContains: uid));
    result.fold((left) {
      left.docs.forEach((value) {
        listofgrups.add(modelofgropandid(
            GroupModelcreate.fromjson(value.data()), value.id));
      });
      datareturn = Left(listofgrups);
    }, (right) {
      datareturn = Right(right);
    });
    return datareturn!;
  }
}

class modelofgropandid {
  GroupModelcreate groupmdodel;
  String id;
  modelofgropandid(this.groupmdodel, this.id);
}
