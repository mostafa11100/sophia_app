import 'package:either_dart/either.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/firebase_firestore.dart';

class CreateChate {
  FirebaseFireStoreFunctions? fire;

  Future<ExeptionsFirebase?> create(Map<String, dynamic> json) async {
    fire = FirebaseFireStoreFunctions();
    try {
      ExeptionsFirebase? re =
          await fire!.createdocs(json: json, colection: "chats");
      return re;
    } catch (e) {
      return ExeptionsFirebase.fromejson(e.toString());
    }
  }
}
