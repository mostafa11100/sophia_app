// ignore_for_file: must_be_immutable

part of 'log_in_cubit.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}

final class LogInloading extends LogInState {}

final class LogInsucces extends LogInState {
  UserCredential user;
  LogInsucces(this.user);
}

final class LogInfail extends LogInState {
  String error;
  bool state;
  LogInfail(this.error, this.state);
}
