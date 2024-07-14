class ModelUpdateProfile {
  String? name;
  String? email;
  String? location;
  String? phone;
  String? url;
  String? description;
  Map<String, dynamic> json = {};
  ModelUpdateProfile.tojson(
      {this.name,
      this.email,
      this.location,
      this.phone,
      this.description,
      this.url}) {
    json['name'] = name;
    json['email'] = email;
    json['location'] = location;
    json['phone'] = phone;
    json['description'] = description;
    json['url'] = url;
  }
}
