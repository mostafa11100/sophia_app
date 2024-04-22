import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/firebase_add_date.dart';

abstract class UpdatesearchHistory {
  update({field});
}

class UpdateHistory extends UpdatesearchHistory {
  FirebaseAddDate? add;
  @override
  Future<ExeptionsFirebase?> update({field, docs, data}) async {
    ExeptionsFirebase? response = await FirebaseAddDate.updatedata(
        collection: "user", docs: docs, feild: field, data: data);

    return response;
  }
}
