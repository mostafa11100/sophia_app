part of 'get_chat_cubit.dart';

@immutable
sealed class GetChatState {}

final class GetChatInitial extends GetChatState {}

final class GetChatlodaing extends GetChatState {}

final class GetChatsuccess extends GetChatState {
  ChatModel chat;
  String id;
  GetChatsuccess(this.chat, this.id);
}

final class GetChatfail extends GetChatState {
  GetChatfail(this.error);
  String error;
}
