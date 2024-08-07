import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String? uid1, uid2;
  DateTime? time;
  List<MessageModel>? message = [];

  Map<String, dynamic>? json;
  ChatModel.fromjson(Map<String, dynamic> json) {
    uid1 = json['uid1'];
    uid2 = json['uid2'];

    print(json['message']);
    for (int i = json['message'].length - 1; i >= 0; i--) {
      message!.add(MessageModel.fromjson(json['message'][i]));
    }
  }
  ChatModel.tojson({this.message, this.uid1, this.uid2}) {
    json?['messages'] = message;
    json?['uid1'] = uid1;
    json?['uid2'] = uid2;
  }
}

class MessageModel {
  bool? call;
  bool? image;
  String? message;
  String? url;
  bool? seen;
  String? uid;
  Timestamp? time;
  String? type;
  Map<String, dynamic>? json = {};
  MessageModel.fromjson(Map json) {
    call = json['call'];
    image = json['image'];
    message = json['message'];
    seen = json['seen'];
    uid = json['uid'];
    type = json['type'] ?? "message";
    time = json['time'];
    url = json['url'] ?? "";
  }
  MessageModel.tojson(
      {this.call,
      this.image,
      this.message,
      this.seen,
      this.time,
      this.uid,
      this.url,
      this.type = "message"}) {
    json?['call'] = call;
    json?['image'] = image;
    json?['message'] = message;
    json?['seen'] = seen;
    json?['time'] = time;
    json?['uid'] = uid;
    json?['type'] = type;
    json?['url'] = url;
  }
}
