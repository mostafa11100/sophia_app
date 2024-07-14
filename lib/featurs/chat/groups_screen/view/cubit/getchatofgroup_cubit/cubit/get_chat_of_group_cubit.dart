import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/data/models/group_model.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/cubit/cubit/get_groups_cubit.dart';
import 'package:sophia_chat/featurs/profile/data/repo/repo_get_friends.dart';

part 'get_chat_of_group_state.dart';

class GetChatOfGroupCubit extends Cubit<GetChatOfGroupState> {
  GetChatOfGroupCubit() : super(GetChatOfGroupInitial());
  bool closee = false;
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? listen;
  GroupAndmembersmdoel? groupAndmembersmdoel;
  FirebaseFirestore? fire;
  RepoGetFriends? getmembers;
  getchat({groupid}) async {
    fire = FirebaseFirestore.instance;
    GroupModelcreate? groupModelcreate;
    emit(GetChatOfGroupLoading());

    getmembers = RepoGetFriends();

    listen = await fire!.collection('groups').doc(groupid).snapshots().listen(
      (e) async {
        groupModelcreate = GroupModelcreate.fromjson(e.data());
        Either<List<UserModel>, ExeptionsFirebase> result =
            await getmembers!.get(groupModelcreate!.members!);

        result.fold((left) {
          emit(GetChatOfGroupSucces(left, groupModelcreate!));
        }, (right) {
          emit(GetChatOfGroupFail(right.eror!));
        });
      },
    );
  }

  @override
  Future<void> close() async {
    // TODO: implement close
    await listen!.cancel();
    return super.close();
  }
}
