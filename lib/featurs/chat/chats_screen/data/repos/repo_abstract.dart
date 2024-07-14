import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/getdata_formfirebase.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

abstract class RepoGetData {
  Future<Either<dynamic, ExeptionsFirebase>?> getdata({uid1});
}

class getuserstory extends RepoGetData {
  List<UserModel> listofusermodel = [];
  Either<dynamic, ExeptionsFirebase>? either;
  @override
  Future<Either<dynamic, ExeptionsFirebase>?> getdata({uid1}) async {
    ;
    String? uid;
    GetDataFromFirebase getdata = GetDataFromFirebase();
    try {
      Either<QuerySnapshot<Map>, ExeptionsFirebase> result =
          await getdata.getdata(
        "friends",
        Filter.or(
          Filter('uid1', isEqualTo: uid1),
          Filter('uid2', isEqualTo: uid1),
        ),
      );

      await result.fold((l) async {
        await Future.forEach(l.docs, (element) async {
          uid = element['uid1'] == uid1 ? element['uid2'] : element['uid1'];
          Either<DocumentSnapshot<Map<String, dynamic>>, ExeptionsFirebase>
              result = await getdata.getdocsdata("user", uid);
          result.fold((l) {
            listofusermodel.add(UserModel.fromjson(json: l.data()!, uid: l.id));
          }, (r) {
            either = Right(r);
          });
        });
        either = Left(listofusermodel);
      }, (r) {
        either = Right(r);
      });
      return either;
    } catch (e) {
      return Right(ExeptionsFirebase.fromejson(e.toString()));
    }
  }
}
