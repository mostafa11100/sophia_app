import 'package:bloc/bloc.dart';
import 'package:either_dart/src/either.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/repos/repo_abstract.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  bool disbose = false;
  UserDataCubit() : super(UserDataInitial());
  getuserstory? repo;
  SharedPref? pref;
  getdata() async {
    pref = SharedPref();

    repo = getuserstory();
    emit(UserDatalodaing());

    //Future uid = await pref!.getfromshared("uid");

    Either<dynamic, ExeptionsFirebase>? result =
        await repo?.getdata(uid1: "jTfN06KUljT13n8wK75mkwPakGm1");
    result!.fold((l) {
      if (!disbose) {
        emit(UserDatasuccess(l));
      }
    }, (r) {
      if (!disbose) {
        emit(UserDatafail(r.eror!));
      }
    });
  }

  @override
  Future<void> close() {
    disbose = true;

    return super.close();
  }
}
