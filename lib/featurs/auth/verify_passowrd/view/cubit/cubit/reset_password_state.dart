part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordloadin extends ResetPasswordState {}

final class ResetPasswordsuccess extends ResetPasswordState {
  String done =
      "we are sended link to your gemil to reset password please check your gemil then login ";
}

final class ResetPasswordfail extends ResetPasswordState {
  String error;
  ResetPasswordfail(this.error);
}
