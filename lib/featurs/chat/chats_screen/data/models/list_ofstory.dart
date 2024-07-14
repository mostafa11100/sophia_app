import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sophia_chat/function/convert_temp_totime.dart';

class ListOfStorys {
  String? caption = "";
  String? story;
  String? time;
  Timestamp? timestmp;
  String? type;
  String? backgroundcolor;
  Map<String, dynamic> json = {};
  ListOfStorys.fromjson(Map json) {
    Timestamp t;
    caption = json['caption'];
    story = json['story'];
    t = json['time'];
    type = json['type'];
    backgroundcolor = json['backgroundcolor'];
    time = converttime(t.toDate());
  }
  ListOfStorys.tojson(
      {this.caption,
      this.story,
      this.timestmp,
      this.type,
      this.backgroundcolor}) {
    json['caption'] = caption;
    json['story'] = story;
    json['time'] = timestmp;
    json['type'] = type;
    json['backgroundcolor'] = backgroundcolor;
  }
}
