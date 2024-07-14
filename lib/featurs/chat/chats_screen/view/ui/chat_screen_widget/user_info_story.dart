import 'package:flutter/material.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

Widget userinfo_story({UserModel? usermodel}) {
  return Builder(builder: (context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        isThreeLine: true,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(usermodel!.url!),
          radius: MediaQuery.of(context).size.width / 11,
        ),
        title: Text(
          usermodel.name!,
          style: TextStyleConst.textstyle17.copyWith(color: Colors.white),
        ),
        subtitle: Text(
          "23 m ago",
          style: TextStyleConst.textstyle17.copyWith(color: Colors.white),
        ),
        trailing: Icon(
          Icons.more_vert,
          color: Colors.white,
          size: MediaQuery.of(context).size.width / 13,
        ),
      ),
    );
  });
}
