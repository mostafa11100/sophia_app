// ignore_for_file: must_be_immutable

part of 'get_user_data_cubit.dart';

@immutable
sealed class GetUserState {}

final class GetUserInitial extends GetUserState {}

final class GetUsersucces extends GetUserState {
  UserModel usermodel;
  GetUsersucces(this.usermodel);
}

final class GetUserfail extends GetUserState {
  String error;
  GetUserfail(this.error);
}

final class GetUserloading extends GetUserState {}
