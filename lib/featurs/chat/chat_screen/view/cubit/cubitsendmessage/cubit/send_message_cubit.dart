import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/Repo/sendmessage_repo.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/chat_model.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit() : super(SendMessageInitial());
  SendMessageToFireStore? sendmessage;
  void send(docs, MessageModel message) async {
    sendmessage = SendMessageToFireStore();
    print(message.json);
    ExeptionsFirebase? re =
        await sendmessage!.sendmessage(message: message.json, docs: docs);

    if (re == null) {
      print("send");
      emit(SendMessagesucces());
    } else {
      print(re.eror);
      emit(SendMessagefail(re.eror!));
    }
  }
}
