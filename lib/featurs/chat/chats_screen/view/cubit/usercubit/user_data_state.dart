part of 'user_data_cubit.dart';

@immutable
sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class UserDatasuccess extends UserDataState {
  List<UserModel> listofusermodel;
  UserDatasuccess(this.listofusermodel);
}

final class UserDatalodaing extends UserDataState {}

final class UserDatafail extends UserDataState {
  String error;
  UserDatafail(this.error);
}
