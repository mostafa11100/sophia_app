// ignore_for_file: must_be_immutable

part of 'add_user_data_to_firebase_cubit.dart';

@immutable
sealed class AddUserDataToFirebaseState {}

final class AddUserDataToFirebaseInitial extends AddUserDataToFirebaseState {}

final class AddUserDataToFirebaseloading extends AddUserDataToFirebaseState {}

final class AddUserDataToFirebasesuccess extends AddUserDataToFirebaseState {}

final class AddUserDataToFirebasefail extends AddUserDataToFirebaseState {
  AddUserDataToFirebasefail(this.error);
  String? error;
}
