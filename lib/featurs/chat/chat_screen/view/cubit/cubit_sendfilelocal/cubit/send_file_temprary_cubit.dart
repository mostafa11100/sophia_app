import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/chat_model.dart';

part 'send_file_temprary_state.dart';

class SendFileTempraryCubit extends Cubit<SendFileTempraryState> {
  SendFileTempraryCubit() : super(SendFileTempraryInitial());
  send(MessageModel chat, String id) {
    emit(SendFileTemprarySend(chat, id));
  }
}
