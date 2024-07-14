import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/firebase_add_date.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/data/models/group_model.dart';

class RepoCreateGroup {
  Future<ExeptionsFirebase?> adddata(GroupModelcreate model) async {
    try {
      ExeptionsFirebase? result =
          await FirebaseAddDate.adddata(data: model.json, collection: "groups");
      return result;
    } catch (e) {
      return ExeptionsFirebase.fromejson(e.toString());
    }
  }
}
