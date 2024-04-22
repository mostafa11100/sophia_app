import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/list_ofstory.dart';
import 'package:sophia_chat/function/convert_temp_totime.dart';

class UserModel {
  String? name;
  String? email;
  String? passowrd;
  String? url;
  bool? online;
  String? gender;
  String? bio;
  String? description;
  late List<dynamic>? followers = [];
  late List<dynamic>? searchhistory = [];
  late List<dynamic>? searchhistoryvisited = [];
  late List<dynamic>? following = [];
  late List<dynamic>? friends = [];
  List<PublicPostModel>? puplicpost = [];
  String? uid;

  Map? jsonofmodel = {};
  List<ListOfStorys>? listofs = [];
  UserModel.fromjson({required Map<String, dynamic> json, this.uid}) {
    //print(json);
    name = json['name'];
    email = json['email'];
    passowrd = json['passowrd'];
    gender = json['gender'];
    url = json['photo'];
    online = json['online'];
    gender = json['gender'];
    followers = json['followers'] ?? [];

    following = json['following'] ?? [];
    friends = json['friends'] ?? [];
    description = json['description'] ?? "";
    bio = json['bio'] ?? "";
    searchhistory = json['searchhistory'] ?? [];
    searchhistoryvisited = json['searchhistoryvisited'] ?? [];
    for (Map element in json['images'] ?? []!) {
      puplicpost!.add(PublicPostModel.fromjson(element));
    }
    for (var element in json["story"] ?? []) {
      listofs!.add(ListOfStorys.fromjson(element));
    }
  }
  UserModel.tojson(
      {this.name,
      this.email,
      this.passowrd,
      this.description,
      this.followers,
      this.bio,
      this.friends,
      this.following,
      this.gender,
      this.jsonofmodel,
      this.listofs,
      this.puplicpost,
      this.url,
      this.online,
      this.uid = ""}) {
    jsonofmodel?['name'] = name;
    jsonofmodel?['url'] = url;
    jsonofmodel?['state'] = online;
    jsonofmodel?['bio'] = bio;
    jsonofmodel?['following'] = following;
    jsonofmodel?['followers'] = followers;
    jsonofmodel?['description'] = description;
    jsonofmodel?['followers'] = followers;
    jsonofmodel?['publicpost'] = puplicpost;
  }
}

class PublicPostModel {
  String? caption;

  String? imgurl;
  String? time;
  Map json = {};
  PublicPostModel.fromjson(Map jsn) {
    caption = jsn['caption'];

    imgurl = jsn['imgurl'];
    Timestamp tt = jsn['time'];
    time = converttime(tt.toDate());
  }

  PublicPostModel.tojson({this.caption, this.imgurl}) {
    json['caption'] = caption;
    json['imgurl'] = imgurl;
    json['time'] = Timestamp.now();
  }
}
