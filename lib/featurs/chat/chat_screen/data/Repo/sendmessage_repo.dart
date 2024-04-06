import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/firebase_add_date.dart';

abstract class SendmessageRepo {
  dynamic sendmessage({dynamic message});
}

class SendMessageToFireStore extends SendmessageRepo {
  @override
  sendmessage({message, docs}) async {
    try {
      ExeptionsFirebase? result = await FirebaseAddDate.updatedata(
          data: message, collection: "chats", docs: docs);

      return result;
    } catch (e) {
      print(e.toString());
      return ExeptionsFirebase.fromejson(e.toString());
    }
  }
}
