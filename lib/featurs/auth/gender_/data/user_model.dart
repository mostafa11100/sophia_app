// class UserModel {
//   String? name;
//   String? email;
//   String? passowrd;
//   String? photo;
//   String? gender;
//   String? uid;
//   Map<String, String>? jsoon = {};
//   UserModel.tojson(
//       {this.name, this.email, this.passowrd, this.photo = "", this.gender}) {
//     jsoon = {
//       'name': name!,
//       'email': email!,
//       'password': passowrd!,
//       'photo': photo!,
//       'gender': gender!
//     };
//   }
//   UserModel.fromjson({Map<String, dynamic>? json, this.uid = ""}) {
//     name = json!['name'];
//     email = json['email'];
//     passowrd = json['passowrd'];
//     photo = json['photo'];
//     gender = json['gender'];
//   }
// }
