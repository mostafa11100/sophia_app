import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/getdata_formfirebase.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/profile/data/repo/repo_get_friends.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  bool disbose = false;
  UserDataCubit() : super(UserDataInitial());
  GetDataFromFirebase? repogetuser;
  SharedPref? pref;
  RepoGetFriends? getfriends;
  getdata(bool refresh) async {
    pref = SharedPref();
    getfriends = RepoGetFriends();
    repogetuser = GetDataFromFirebase();
    if (!refresh) emit(UserDatalodaing());

    pref = SharedPref();
    String uid = await pref!.getfromshared('uid');
    Either<DocumentSnapshot<Map<String, dynamic>>, ExeptionsFirebase> userjson =
        await repogetuser!.getdocsdata("user", uid);

    await userjson.fold((left) async {
      UserModel usermodel = UserModel.fromjson(json: left.data()!, uid: uid);

      Either<List<UserModel>, ExeptionsFirebase> friends =
          await getfriends!.get(usermodel.friends!);
      friends.fold((l) {
        if (!disbose) {
          l.insert(0, UserModel.fromjson(json: left.data()!, uid: uid));
          emit(UserDatasuccess(l));
        }
      }, (r) {
        if (!disbose) {
          emit(UserDatafail(r.eror!));
        }
      });
    }, (right) {
      emit(UserDatafail(right.eror!));
    });
  }

  @override
  Future<void> close() {
    disbose = true;

    return super.close();
  }
}
