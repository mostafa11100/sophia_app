import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/firebase_add_date.dart';

abstract class SendmessageRepo {
  dynamic sendmessage(
      {message, docs, required String docsname, required feildname});
}

class SendMessageToFireStore extends SendmessageRepo {
  @override
  sendmessage(
      {message, docs, required String docsname, required feildname}) async {
    try {
      ExeptionsFirebase? result = await FirebaseAddDate.updatedata(
          data: message, collection: docsname, docs: docs, feild: feildname);

      return result;
    } catch (e) {
      return ExeptionsFirebase.fromejson(e.toString());
    }
  }
}
