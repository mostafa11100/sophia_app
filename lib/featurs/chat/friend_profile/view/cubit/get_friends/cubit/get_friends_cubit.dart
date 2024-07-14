import 'package:bloc/bloc.dart';
import 'package:either_dart/src/either.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/profile/data/repo/repo_get_friends.dart';

part 'get_friends_state.dart';

class GetFriendsCubit extends Cubit<GetFriendsState> {
  GetFriendsCubit(this.getdata) : super(GetFriendsInitial());
  RepoGetFriends getdata;
  bool closee = false;
  getfriends(List<dynamic> listoffriends) async {
    try {
      emit(GetFriendsloading());
      getdata = RepoGetFriends();
      Either<List<UserModel>, ExeptionsFirebase> result =
          await getdata.get(listoffriends);

      result.fold((left) {
        if (!closee) emit(GetFriendssuccess(left));
      }, (right) {
        if (!closee) emit(GetFriendsfail(right.eror!));
      });
    } catch (e) {
      if (!closee) emit(GetFriendsfail(e.toString()));
    }
  }

  @override
  Future<void> close() {
    closee = true;
    return super.close();
  }
}
