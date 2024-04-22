part of 'get_friends_cubit.dart';

@immutable
sealed class GetFriendsState {}

final class GetFriendsInitial extends GetFriendsState {}

final class GetFriendsloading extends GetFriendsState {}

final class GetFriendssuccess extends GetFriendsState {
  List<UserModel> listofusers;
  GetFriendssuccess(this.listofusers);
}

final class GetFriendsfail extends GetFriendsState {
  String error;
  GetFriendsfail(this.error);
}
