import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:either_dart/src/either.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/getdata_formfirebase.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

class GetUserDataFromFireStore {
  GetDataFromFirebase? gett;

  Future<Either<ExeptionsFirebase, ModelOfHistory>?> getdata(docs) async {
    gett = GetDataFromFirebase();
    Either<ExeptionsFirebase, ModelOfHistory>? returnvalue;
    List<UserModel> listofusermodel = [];
    UserModel usermodel;
    Either<DocumentSnapshot<Map<String, dynamic>>, ExeptionsFirebase> result =
        await gett!.getdocsdata("user", docs);

    await result.fold((left) async {
      usermodel = UserModel.fromjson(json: left.data()!, uid: left.id);
      await Future.forEach(usermodel.searchhistoryvisited!, (value) async {
        Either<DocumentSnapshot<Map<String, dynamic>>, ExeptionsFirebase>
            result2 = await gett!.getdocsdata("user", value);

        result2.fold((left) {
          listofusermodel
              .add(UserModel.fromjson(json: left.data()!, uid: left.id));
        }, (right) {});
      });
      returnvalue = Right(ModelOfHistory(usermodel, listofusermodel));
    }, (right) {
      returnvalue = Left(right);
    });

    return returnvalue;
  }
}

class ModelOfHistory {
  UserModel usermodel;
  List<UserModel> listofusermodel;
  ModelOfHistory(this.usermodel, this.listofusermodel);
}
