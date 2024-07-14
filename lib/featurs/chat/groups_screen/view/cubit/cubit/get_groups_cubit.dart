import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/data/models/group_model.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/data/repo_get_groups.dart';
import 'package:sophia_chat/featurs/profile/data/repo/repo_getuser_data.dart';

part 'get_groups_state.dart';

class GetGroupsCubit extends Cubit<GetGroupsState> {
  GetGroupsCubit() : super(GetGroupsInitial());

  SharedPref? pref;
  GetUserData? getuserdata;
  RepoGetGroups? repoGetGroups;
  bool coloose = false;
  void getgroups(bool refresh) async {
    getuserdata = GetUserData();
    pref = SharedPref();
    List<GroupAndmembersmdoel> listofgroupandmembers = [];
    if (!refresh) emit(GetGroupsLoaing());
    // String uid = await pref!.getfromshared('uid');

    pref = SharedPref();
    String uid = await pref!.getfromshared('uid');
    repoGetGroups = RepoGetGroups();
    try {
      Either<List<modelofgropandid>, ExeptionsFirebase>? result =
          await repoGetGroups!.GetGroups(uid);
      await result!.fold((left) async {
        await Future.forEach(left, (value) async {
          List<UserModel> listof3members = [];
          await Future.forEach(value.groupmdodel.members!, (value2) async {
            Either<UserModel, ExeptionsFirebase> re =
                await getuserdata!.get(value2);
            re.fold((left) {
              listof3members.add(left);
            }, (r) {});
          });
          listofgroupandmembers.add(GroupAndmembersmdoel(
              value.groupmdodel, listof3members, value.id));
        });
        if (!coloose) emit(GetGroupsSucces(listofgroupandmembers));
      }, (Right) {
        if (!coloose) emit(GetGroupsfail(Right.eror!));
      });
    } catch (e) {
      if (!coloose) emit(GetGroupsfail(e.toString()));
    }
  }

  @override
  Future<void> close() {
    coloose = true;
    return super.close();
  }
}

class GroupAndmembersmdoel {
  String id;
  GroupModelcreate? groupModelcreate;
  List<UserModel> mdmbers = [];
  GroupAndmembersmdoel(this.groupModelcreate, this.mdmbers, this.id);
}
