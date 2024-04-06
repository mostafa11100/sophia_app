import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';

class FirebaseAddDate {
  static FirebaseFirestore? db;
  static Future<ExeptionsFirebase?> updatedata({data, collection, docs}) async {
    try {
      db = FirebaseFirestore.instance;
      await db!.collection(collection).doc(docs).update({
        "message": FieldValue.arrayUnion([data]),
      });
      return null;
    } on FirebaseException catch (e) {
      return ExeptionsFirebase.fromejson(e.message.toString());
    } catch (e) {
      return ExeptionsFirebase.fromejson(e.toString());
    }
  }
}
