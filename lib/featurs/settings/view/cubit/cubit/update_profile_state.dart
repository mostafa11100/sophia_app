part of 'update_profile_cubit.dart';

@immutable
sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileloading extends UpdateProfileState {}

final class UpdateProfilesuccess extends UpdateProfileState {}

final class UpdateProfilefail extends UpdateProfileState {
  String eror;
  UpdateProfilefail(this.eror);
}
