import 'package:either_dart/either.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/profile/data/repo/repo_getuser_data.dart';

class RepoGetFriends {
  GetUserData? getuserdata;
  Future<Either<List<UserModel>, ExeptionsFirebase>> get(
      List<dynamic> listofuid) async {
    try {
      List<UserModel> listofriends = [];

      getuserdata = GetUserData();
      await Future.forEach(listofuid, (value) async {
        Either<UserModel, ExeptionsFirebase> friends =
            await getuserdata!.get(value);

        friends.fold((left) {
          listofriends.add(left);
        }, (right) {});
      });
      return Left(listofriends);
    } catch (e) {
      return Right(ExeptionsFirebase.fromejson(e.toString()));
    }
  }
}
