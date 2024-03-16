class contactModel {
  String? name = "mostafa";
  String? url =
      "https://media.licdn.com/dms/image/C4D03AQG4jENk0cwMAQ/profile-displayphoto-shrink_800_800/0/1615828289513?e=2147483647&v=beta&t=pmKsR_Ohwj-dklToLRRZZ4nZa4h9pvlIi_JRdMseQkQ";
  bool? online = false;
  int? state = 0;
  String? time = "27m ago";
  String? msg = "how are you";
  bool? call = true;
  int? seen = 1;

  Map? jsonofmodel = {};
  contactModel.fromjson(Map? json) {
    //print(json);
    {
      if (json != null) {
        name = json['name'];
        url = json!['url'];
        state = json['state'];
        online = json['online'];
        time = json['time'];
        msg = json['msg'];
        call = json['call'];
        seen = json['seen'];
      }
    }
  }
  contactModel.tojson(this.name, this.url, this.state, this.online, this.time,
      this.msg, this.call, this.seen) {
    jsonofmodel?['name'] = name;
    jsonofmodel?['url'] = url;
    jsonofmodel?['state'] = state;
    jsonofmodel?['online'] = online;
    jsonofmodel?['time'] = time;
    jsonofmodel?['msg'] = msg;
    jsonofmodel?['call'] = call;
    jsonofmodel?['seen'] = seen;
  }
}
