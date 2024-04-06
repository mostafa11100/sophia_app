part of 'send_message_cubit.dart';

@immutable
sealed class SendMessageState {}

final class SendMessageInitial extends SendMessageState {}

final class SendMessagesucces extends SendMessageState {}

final class SendMessagefail extends SendMessageState {
  String error;
  SendMessagefail(this.error);
}
