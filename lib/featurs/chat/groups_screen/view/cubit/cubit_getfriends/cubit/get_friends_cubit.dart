import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/profile/data/repo/repo_get_friends.dart';

part 'get_friends_state.dart';

class GetFriendsCubit extends Cubit<GetFriendsState> {
  GetFriendsCubit(this._getFriends) : super(GetFriendsInitial());
  RepoGetFriends _getFriends;
  Get(UserModel usermodel) async {
    emit(GetFriendsloading());
    //lodaing
    try {
      Either<List<UserModel>, ExeptionsFirebase> result =
          await _getFriends.get(usermodel.friends!);
      result.fold((left) {
        emit(GetFriendssucces(left));
//success
      }, (right) {
        //error
        emit(GetFriendsfail(right.eror!));
      });
    } catch (e) {
      emit(GetFriendsfail(e.toString()));
      //error
    }
  }
}
