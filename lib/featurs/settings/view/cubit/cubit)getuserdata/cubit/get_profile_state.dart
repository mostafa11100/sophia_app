// ignore_for_file: must_be_immutable

part of 'get_profile_cubit.dart';

@immutable
sealed class GetProfileState {}

final class GetProfileInitial extends GetProfileState {}

final class GetProfilesuccess extends GetProfileState {
  UserModel usermodel;
  GetProfilesuccess(this.usermodel);
}

final class GetProfileloading extends GetProfileState {}

final class GetProfilefail extends GetProfileState {
  String error;
  GetProfilefail(this.error);
}
