class UserModel {
  String? name;
  String? url;
  int? state;

  Map? jsonofmodel = {};
  UserModel.fromjson(Map json) {
    name = json['name'];
    url = json['photo'];
    state = json['state'];
  }
  UserModel.tojson(this.name, this.url, this.state) {
    jsonofmodel?['name'] = name;
    jsonofmodel?['url'] = url;
    jsonofmodel?['state'] = state;
  }
}
