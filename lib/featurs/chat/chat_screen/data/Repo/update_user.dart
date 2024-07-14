import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/firebase_add_date.dart';

class UpdateUsers {
  Future<ExeptionsFirebase?> update(uid1, uid2) async {
    ExeptionsFirebase? re1 =
        await FirebaseAddDate.update(collection: "user", docs: uid1, data: {
      "chats": FieldValue.arrayUnion([uid2])
    });

    if (re1 == null) {
      ExeptionsFirebase? re2 =
          await FirebaseAddDate.update(collection: "user", docs: uid2, data: {
        "chats": FieldValue.arrayUnion([uid1])
      });
      if (re2 != null) {
        return ExeptionsFirebase.fromejson("Network error");
      }
    } else {
      print("errror when add userrrr${re1.eror}");
      return ExeptionsFirebase.fromejson("Network error");
    }
    return null;
  }
}
