part of 'get_chat_of_group_cubit.dart';

@immutable
sealed class GetChatOfGroupState {}

final class GetChatOfGroupInitial extends GetChatOfGroupState {}

final class GetChatOfGroupLoading extends GetChatOfGroupState {}

final class GetChatOfGroupSucces extends GetChatOfGroupState {
  List<UserModel> members;
  GroupModelcreate groupModelcreate;
  GetChatOfGroupSucces(this.members, this.groupModelcreate);
}

final class GetChatOfGroupFail extends GetChatOfGroupState {
  String error;
  GetChatOfGroupFail(this.error);
}
