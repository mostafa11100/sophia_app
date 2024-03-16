import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/featurs/auth/verify_passowrd/data/repos/abstract_resetpassowrd.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.reset) : super(ResetPasswordInitial());
  ResetpassowrdFirebase reset;
  void resetpassowrd(email) async {
    emit(ResetPasswordloadin());

    dynamic result = await reset.resetpassowrd(email);
    if (result == null) {
      emit(ResetPasswordsuccess());
    } else {
      emit(ResetPasswordfail(result.eror));
    }
  }
}
