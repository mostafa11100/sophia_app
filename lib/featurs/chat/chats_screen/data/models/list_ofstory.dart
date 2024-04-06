import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sophia_chat/function/convert_temp_totime.dart';

class ListOfStorys {
  String? caption = "";
  String? story;
  String? time;
  ListOfStorys.fromjson(Map json) {
    Timestamp t;
    caption = json['caption'];
    story = json['story'];
    t = json['time'];
    time = converttime(t.toDate());
  }
}
