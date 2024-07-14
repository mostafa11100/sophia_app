import 'package:sophia_chat/featurs/chat/chats_screen/data/models/chat_model.dart';

class GroupModelcreate {
  String? name;
  String? photo;
  String? owner;
  Settingmodel? settingmodel;
  List? members = [];
  List? admins = [];

  List<MessageModel>? message = [];
  Map<String, dynamic> json = {};

  GroupModelcreate.fromjson(Map? json) {
    name = json!['name'];
    photo = json['photo'];
    owner = json['owner'];
    settingmodel = Settingmodel.fromjson(json['setting']);
    admins = json['admins'];
    members = json['members'];
    List listofmessages = json['messages'] == null ? [] : json['messages'];
    listofmessages.reversed.forEach((value) {
      message!.add(MessageModel.fromjson(value));
    });
  }
  GroupModelcreate.tojson(this.name, this.photo, this.owner, this.admins,
      this.members, this.settingmodel, this.message) {
    members!.insert(0, owner);
    json['name'] = name;
    json['photo'] = photo;
    json['owner'] = owner;
    json['setting'] = settingmodel!.json;
    json['admins'] = admins;
    json['members'] = members!;
    json['messages'] = message;
  }
}

class Settingmodel {
  bool? sendmessage;
  bool? addothermembers;
  Map json = {};
  Settingmodel.fromjson(Map? json) {
    sendmessage = json!['sendmessage'];

    addothermembers = json['addothermembers'];
  }
  Settingmodel.tojson(this.sendmessage, this.addothermembers) {
    json['sendmessage'] = sendmessage;
    json['addothermembers'] = addothermembers;
  }
}
