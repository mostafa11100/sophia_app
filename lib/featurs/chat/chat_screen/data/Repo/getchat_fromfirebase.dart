import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';

abstract class GetDataRepo {
  dynamic getdata(uid1, uid2);
}

class GetChatFromFireBase extends GetDataRepo {
  FirebaseFirestore? db;

  @override
  Future<
      Either<StreamSubscription<QuerySnapshot<Map<String, dynamic>>>,
          ExeptionsFirebase>> getdata(uid1, uid2) async {
    db = FirebaseFirestore.instance;
    try {
      StreamSubscription<QuerySnapshot<Map<String, dynamic>>> result = await db!
          .collection("chats")
          .where(Filter.or(
              Filter("uid1", isEqualTo: uid1), Filter("uid1", isEqualTo: uid2)))
          .where(Filter.or(
              Filter("uid2", isEqualTo: uid1), Filter("uid2", isEqualTo: uid2)))
          .snapshots()
          .listen((event) {});

      return Left(result);
    } catch (e) {
      return Right(ExeptionsFirebase.fromejson(e));
    }
  }
}
