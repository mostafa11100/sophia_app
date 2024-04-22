import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/firebase_add_date.dart';
import 'package:sophia_chat/featurs/chat/friend_profile/data/repos/abstract_repo_update_data.dart';

class UpdateFollwoingData extends UpdateDataFireStore {
  @override
  Future<ExeptionsFirebase?> update(
      {String? feild, data, String? docs, remove}) async {
    try {
      if (remove) {
        await FirebaseAddDate.removefeildinarray(
            data: data, feild: feild!, collection: "user", docs: docs!);
      } else {
        await FirebaseAddDate.updatedata(
            data: data, feild: feild!, collection: "user", docs: docs!);
      }
      return null;
    } catch (e) {
      return ExeptionsFirebase.fromejson(e.toString());
    }
  }
}
