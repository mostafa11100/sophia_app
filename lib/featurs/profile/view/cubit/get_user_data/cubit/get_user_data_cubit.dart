import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/profile/data/model/profilemodel.dart';
import 'package:sophia_chat/featurs/profile/data/repo/repo_get_friends.dart';
import 'package:sophia_chat/featurs/profile/data/repo/repo_getuser_data.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit() : super(GetUserDataInitial());
  GetUserData? getuser;
  RepoGetFriends? getfriends;
  bool closecubit = false;
  SharedPref? pref;
  getdata() async {
    List<UserModel> listofriends = [];
    UserModel? userModel;

    pref = SharedPref();
    String uid = await pref!.getfromshared('uid');
    getfriends = RepoGetFriends();
    emit(GetUserDataloading());
    getuser = GetUserData();
    try {
      Either<UserModel, ExeptionsFirebase> result = await getuser!.get(uid);
      await result.fold((left) async {
        userModel = left;
        //await Future.forEach(left.friends!, (value) async {
        Either<List<UserModel>, ExeptionsFirebase> friends =
            await getfriends!.get(left.friends!);
        friends.fold((left) {
          listofriends = left;
        }, (right) {});
        // });
        if (!closecubit) {
          emit(GetUserDatasucces(
              ProfileModel(usermodel: userModel!, listofriends: listofriends)));
        }
      }, (right) {
        if (!closecubit) {
          emit(GetUserDatafail(right.eror!));
        }
      });
    } catch (e) {
      if (!closecubit) {
        emit(GetUserDatafail(e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    closecubit = true;
    return super.close();
  }
}
