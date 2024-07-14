import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/profile/data/repo/repo_get_friends.dart';
import 'package:sophia_chat/featurs/profile/data/repo/repo_getuser_data.dart';

part 'get_user_data_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit() : super(GetUserInitial());
  GetUserData? getuser;
  RepoGetFriends? getfriends;
  bool closecubit = false;
  SharedPref? pref;
  getdata() async {
    UserModel? userModel;
    getfriends = RepoGetFriends();

    pref = SharedPref();
    String uid = await pref!.getfromshared('uid');
    emit(GetUserloading());
    getuser = GetUserData();
    try {
      Either<UserModel, ExeptionsFirebase> result = await getuser!.get(uid);
      result.fold((left) {
        userModel = left;

        if (!closecubit) {
          emit(GetUsersucces(userModel!));
        }
      }, (right) {
        if (!closecubit) {
          emit(GetUserfail(right.eror!));
        }
      });
    } catch (e) {
      if (!closecubit) {
        emit(GetUserfail(e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    closecubit = true;
    return super.close();
  }
}
