import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/list_ofstory.dart';
import 'package:sophia_chat/function/convert_temp_totime.dart';

class UserModel {
  String? name;
  String? url;
  bool? online;
  String? gender;

  Map? jsonofmodel = {};
  List<ListOfStorys> listofs = [];
  UserModel.fromjson(Map json) {
    name = json['name'];
    print(name);
    url = json['photo'];
    print(url);
    online = json['online'];
    print(online);
    gender = json['gender'];
    //  print(gender);
    print(json['story']);
    for (var element in json["story"]) {
      print(element);
      listofs.add(ListOfStorys.fromjson(element));
    }
  }
  UserModel.tojson(this.name, this.url, this.online) {
    jsonofmodel?['name'] = name;
    jsonofmodel?['url'] = url;
    jsonofmodel?['state'] = online;
  }
}
