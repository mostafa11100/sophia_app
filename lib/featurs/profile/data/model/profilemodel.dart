import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

class ProfileModel {
  UserModel usermodel;
  List<UserModel> listofriends = [];
  ProfileModel({required this.usermodel, required this.listofriends});
}
