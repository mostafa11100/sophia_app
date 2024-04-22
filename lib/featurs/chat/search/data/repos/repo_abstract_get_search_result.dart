import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: implementation_imports
import 'package:either_dart/src/either.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/getdata_formfirebase.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

abstract class GetResultOfSearch {
  getresult({field});
}

class GetTopResultFromFireStore extends GetResultOfSearch {
  GetDataFromFirebase? getdata;
  @override
  Future<Either<List<UserModel>, ExeptionsFirebase>?> getresult({field}) async {
    try {
      Either<List<UserModel>, ExeptionsFirebase>? error;
      List<UserModel> listofusermodel = [];
      getdata = GetDataFromFirebase();
      Either<QuerySnapshot<Map<String, dynamic>>, ExeptionsFirebase>? result =
          await getdata?.getdata(
              "user", Filter('name', isEqualTo: field), null);
      result!.fold((left) {
        for (var element in left.docs) {
          listofusermodel.add(UserModel.fromjson(json: element.data()));
        }
        error = Left(listofusermodel);
      }, (right) {
        error = Right(right);
      });
      return error;
    } catch (e) {
      return Right(ExeptionsFirebase.fromejson(e.toString()));
    }
  }
}
