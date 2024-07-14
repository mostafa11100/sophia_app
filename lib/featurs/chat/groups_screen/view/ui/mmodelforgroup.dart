import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/data/models/group_model.dart';

class groupandmembersmodel {
  GroupModelcreate groupmodel;
  List<UserModel> members;
  groupandmembersmodel(this.groupmodel, this.members);
}
