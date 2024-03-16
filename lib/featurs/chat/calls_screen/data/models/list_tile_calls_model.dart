import 'package:sophia_chat/function/convert_temp_totime.dart';

class CallsModel {
  String?
      missedcalltype; //true mean voice call    --false  mean video call --null mean seen or responsed
  String? time = "12m ago";
  String? uid1, uid2;
  String? calleruid;
  int? numberofcalls = 10;
  CallsModel.fromjson({Map? json}) {
    missedcalltype = json!['calltype'];

    ///time = converttime(json[time]);
    numberofcalls = json["number"];
    uid1 = json['uid1'];
    uid2 = json['uid2'];
    calleruid = json['calleruid'];
  }
}
