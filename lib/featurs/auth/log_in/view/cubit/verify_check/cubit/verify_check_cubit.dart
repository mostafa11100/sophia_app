import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'verify_check_state.dart';

class VerifyCheckCubit extends Cubit<VerifyCheckState> {
  VerifyCheckCubit() : super(VerifyCheckInitial());
  verify(formk, ontext) {
    if (!FirebaseAuth.instance.currentUser!.emailVerified) {}
  }
}
