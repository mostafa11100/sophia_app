part of 'send_file_temprary_cubit.dart';

@immutable
sealed class SendFileTempraryState {}

final class SendFileTempraryInitial extends SendFileTempraryState {}

final class SendFileTemprarySend extends SendFileTempraryState {
  MessageModel chat;
  String id;
  SendFileTemprarySend(this.chat, this.id);
}
