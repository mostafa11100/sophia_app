import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/firebase_add_date.dart';

abstract class SendmessageRepo {
  dynamic sendmessage({dynamic message});
}

class SendMessageToFireStore extends SendmessageRepo {
  @override
  sendmessage({message, docs}) async {
    try {
      print("send");
      print(docs);
      print(message);
      ExeptionsFirebase? result = await FirebaseAddDate.updatedata(
          data: message, collection: "chats", docs: docs);

      return result;
    } catch (e) {
      print(e.toString());
      return ExeptionsFirebase.fromejson(e.toString());
    }
  }
}
