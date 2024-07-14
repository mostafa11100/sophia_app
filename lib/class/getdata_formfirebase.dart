import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';

// where(Filter.or(Filter('uid1', isEqualTo: "8888"),
//               Filter('uid1', isEqualTo: "QYk68SnoDBNBY2WYkjUT0DUG8bi1 ")))
class GetDataFromFirebase {
  FirebaseFirestore? db;
  Future<
      Either<StreamSubscription<QuerySnapshot<Map<String, dynamic>>>,
          ExeptionsFirebase>> getdataandlisten(
      collection, filter1, filter2) async {
    try {
      db = FirebaseFirestore.instance;
      StreamSubscription<QuerySnapshot<Map<String, dynamic>>> result = await db!
          .collection(collection)
          .where(filter1)
          .snapshots()
          .listen((event) {});

      return Left(result);
    } on FirebaseException catch (e) {
      return Right(ExeptionsFirebase.fromejson(e.message));
    } catch (e) {
      return Right(ExeptionsFirebase.fromejson(e.toString()));
    }
  }

  Future<Either<QuerySnapshot<Map<String, dynamic>>, ExeptionsFirebase>>
      getdata(collection, filter1) async {
    try {
      db = FirebaseFirestore.instance;
      QuerySnapshot<Map<String, dynamic>> result =
          await db!.collection(collection).where(filter1).get();

      return Left(result);
    } on FirebaseException catch (e) {
      return Right(ExeptionsFirebase.fromejson(e.message));
    } catch (e) {
      return Right(ExeptionsFirebase.fromejson(e.toString()));
    }
  }

  Future<Either<DocumentSnapshot<Map<String, dynamic>>, ExeptionsFirebase>>
      getdocsdata(collection, docs) async {
    try {
      db = FirebaseFirestore.instance;
      DocumentSnapshot<Map<String, dynamic>> result =
          await db!.collection(collection).doc(docs).get();

      return Left(result);
    } on FirebaseException catch (e) {
      return Right(ExeptionsFirebase.fromejson(e.message));
    } catch (e) {
      return Right(ExeptionsFirebase.fromejson(e.toString()));
    }
  }

  // Future<Either<QuerySnapshot<Map<String, dynamic>>, ExeptionsFirebase>>
  //     searchinfirestore(
  //   collection,
  //   field,
  // ) async {
  //   try {
  //     db = FirebaseFirestore.instance;
  //     QuerySnapshot<Map<String, dynamic>> result =
  //         await db!.collection(collection).where(field).orderBy(field).get();
  //     return Left(result);
  //   } on FirebaseException catch (e) {
  //     return Right(ExeptionsFirebase.fromejson(e.message));
  //   } catch (e) {
  //     return Right(ExeptionsFirebase.fromejson(e.toString()));
  //   }
  // }
}
