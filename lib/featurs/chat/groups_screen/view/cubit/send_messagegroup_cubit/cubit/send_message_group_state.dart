part of 'send_message_group_cubit.dart';

@immutable
sealed class SendMessageGroupState {}

final class SendMessageGroupInitial extends SendMessageGroupState {}

final class SendMessageGroupSucces extends SendMessageGroupState {
  MessageModel message;
  SendMessageGroupSucces(this.message);
}

final class SendMessageGroupFail extends SendMessageGroupState {
  String eror;
  SendMessageGroupFail(this.eror);
}

final class SendMessageGroupLoading extends SendMessageGroupState {
  MessageModel message;
  SendMessageGroupLoading(this.message);
}
