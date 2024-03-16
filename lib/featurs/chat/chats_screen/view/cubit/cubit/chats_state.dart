// ignore_for_file: must_be_immutable

part of 'chats_cubit.dart';

@immutable
sealed class ChatsState {
  List<UserAndChatModel>? userAndChatModel;
}

final class ChatsInitial extends ChatsState {
  ChatsInitial(this.userAndChatModel);
  @override
  List<UserAndChatModel>? userAndChatModel;
}

final class Chatsloading extends ChatsState {}

final class Chatssuccess extends ChatsState {
  @override
  List<UserAndChatModel>? userAndChatModel;
  Chatssuccess(this.userAndChatModel);
}

final class Chatfail extends ChatsState {
  String error;
  Chatfail(this.error);
}
