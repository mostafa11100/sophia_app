import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/featurs/auth/sign_up/data/repo/CreateAcount_EmailAnd_Password.dart';

part 'creat_acount_cubit_state.dart';

class CreatAcountCubit extends Cubit<CreatAcountCubitState> {
  CreatAcountCubit(this.create) : super(CreatAcountCubitInitial());
  CreateAcountEmailAndPassword create;
  void creatacount({email, password}) async {
    try {
      print(email);
      print(password);
      emit(CreatAcountCubitloading());
      Either<UserCredential, ExeptionsFirebase> result =
          await create.createacount(email: email, passowrd: password);

      result.fold((left) {
        print(left.user!.email);
        emit(CreatAcountCubitsuccess(left));
      }, (right) {
        print("rifght == ");
        print(right.eror);
        emit(CreatAcountCubitfail(right.eror!));
      });
    } catch (e) {
      emit(CreatAcountCubitfail(e.toString()));
    }
  }
}
