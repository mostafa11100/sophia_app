class StoryModel {
  String? name;
  String? url;
  int? state;
  Map? jsonofmodel = {};
  StoryModel.fromjson(Map json) {
    name = json['name'];
    url = json['url'];
    state = json['state'];
  }
  StoryModel.tojson(this.name, this.url, this.state) {
    jsonofmodel?['name'] = name;
    jsonofmodel?['url'] = url;
    jsonofmodel?['state'] = state;
  }
}
