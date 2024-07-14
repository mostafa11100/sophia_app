part of 'get_friends_cubit.dart';

@immutable
sealed class GetFriendsState {}

final class GetFriendsInitial extends GetFriendsState {}

final class GetFriendsloading extends GetFriendsState {}

final class GetFriendssucces extends GetFriendsState {
  List<UserModel> friends;
  GetFriendssucces(this.friends);
}

final class GetFriendsfail extends GetFriendsState {
  String error;
  GetFriendsfail(this.error);
}
