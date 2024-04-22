part of 'get_user_data_cubit.dart';

@immutable
sealed class GetUserDataState {}

final class GetUserDataInitial extends GetUserDataState {}

final class GetUserDataloading extends GetUserDataState {}

final class GetUserDatasucces extends GetUserDataState {
  ProfileModel model;
  GetUserDatasucces(this.model);
}

final class GetUserDatafail extends GetUserDataState {
  String error;
  GetUserDatafail(this.error);
}
