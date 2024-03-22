class GroupModel {
  String? name = "school",
      image =
          "https://firebasestorage.googleapis.com/v0/b/sophia-chat.appspot.com/o/profile_photo.PNG?alt=media&token=97cb0f47-420b-4985-8d5e-cfb2b42f8752";
  List<String> members = [
    "https://firebasestorage.googleapis.com/v0/b/sophia-chat.appspot.com/o/profile_photo.PNG?alt=media&token=97cb0f47-420b-4985-8d5e-cfb2b42f8752",
    "https://firebasestorage.googleapis.com/v0/b/sophia-chat.appspot.com/o/empty.PNG?alt=media&token=1cea72c5-8e69-453e-958a-24a7fdea8ee7",
    "https://firebasestorage.googleapis.com/v0/b/sophia-chat.appspot.com/o/profile_photo.PNG?alt=media&token=97cb0f47-420b-4985-8d5e-cfb2b42f8752"
  ];
  GroupModel.fromjson({json}) {
     if (json != null){
    name = json['name'];
    image = json['image'];
    members = json['members'];
     }
  }
}
