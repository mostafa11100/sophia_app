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
  String? location;
  String? phone;
  String? description;
  late List<dynamic>? followers = [];
  late List<dynamic>? searchhistory = [];
  late List<dynamic>? searchhistoryvisited = [];
  late List<dynamic>? following = [];
  late List<dynamic>? friends = [];
  List<String>? puplicpost = [];
  String uid;
  Map<String, dynamic>? jsonofmodel = {};
  List<ListOfStorys>? listofs = [];
  List<dynamic>? listofuserchats = [];
  UserModel.fromjson({required Map<String, dynamic> json, required this.uid}) {
    //print(json);
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    passowrd = json['passowrd'] ?? "";
    gender = json['gender'] ?? "";
    url = json['url'] ?? "";
    online = json['online'] ?? false;
    gender = json['gender'] ?? "";
    phone = json['phone'] ?? "";
    location = json['location'] ?? "";
    followers = json['followers'] ?? [];

    following = json['following'] ?? [];
    friends = json['friends'] ?? [];
    description = json['description'] ?? "";
    bio = json['bio'] ?? "";
    searchhistory = json['searchhistory'] ?? [];
    searchhistoryvisited = json['searchhistoryvisited'] ?? [];
    listofuserchats = json["chats"] ?? [];
    for (String element in json['publicpost'] ?? []) {
      puplicpost!.add(element);
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
      this.listofs,
      this.puplicpost,
      this.url,
      this.online,
      required this.uid}) {
    jsonofmodel?['name'] = name == null ? "" : name;
    jsonofmodel?['url'] = url == null ? "" : url;
    jsonofmodel?['state'] = online == null ? false : online;
    jsonofmodel?['bio'] = bio == null ? "" : bio;
    jsonofmodel?['following'] = following == null ? [] : following;
    jsonofmodel?['followers'] = followers == null ? [] : followers;
    jsonofmodel?['description'] = description == null ? "" : description;

    jsonofmodel?['publicpost'] = puplicpost == null ? [] : puplicpost;
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

class StoryModel {
  String? color;
  String? caption;
  String? url;
  String? type;
  String? time;
  StoryModel.fromjson(Map json) {
    color = json['backgroundcolor'];
    caption = json['capgion'];
    url = json['story'];
    Timestamp t = json['time'];
    time = converttime(t.toDate());
  }
}
