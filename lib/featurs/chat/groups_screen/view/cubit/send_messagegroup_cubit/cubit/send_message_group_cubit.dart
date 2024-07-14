import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/Repo/sendmessage_repo.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/chat_model.dart';

part 'send_message_group_state.dart';

class SendMessageGroupCubit extends Cubit<SendMessageGroupState> {
  bool closecubit = false;
  SendMessageGroupCubit() : super(SendMessageGroupInitial());
  SharedPref? pref;
  SendMessageToFireStore? sendmessage;
  void send({required id, required MessageModel message}) async {
    sendmessage = SendMessageToFireStore();
    emit(SendMessageGroupLoading(message));
    pref = SharedPref();
    // String uid =await pref!.getfromshared('uid');
    ExeptionsFirebase? re = await sendmessage!.sendmessage(
        message: message.json,
        docs: id,
        docsname: 'groups',
        feildname: 'messages');

    if (re == null && !closecubit) {
      emit(SendMessageGroupSucces(message));
    } else {
      if (!closecubit) {
        emit(SendMessageGroupFail(re!.eror!));
      }
    }
  }

  @override
  Future<void> close() {
    closecubit = true;
    return super.close();
  }
}
