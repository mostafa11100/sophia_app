import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/Repo/sendmessage_repo.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/chat_model.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  bool closecubit = false;
  SendMessageCubit() : super(SendMessageInitial());
  SendMessageToFireStore? sendmessage;
  void send(docs, MessageModel message) async {
    sendmessage = SendMessageToFireStore();

    ExeptionsFirebase? re = await sendmessage!.sendmessage(
        message: message.json,
        docs: docs,
        docsname: 'chats',
        feildname: 'message');

    if (re == null && !closecubit) {
      emit(SendMessagesucces());
    } else {
      if (!closecubit) {
        emit(SendMessagefail(re!.eror!));
      }
    }
  }

  @override
  Future<void> close() {
    closecubit = true;
    return super.close();
  }
}
