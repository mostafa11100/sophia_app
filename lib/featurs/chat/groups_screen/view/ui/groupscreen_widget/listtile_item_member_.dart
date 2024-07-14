import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/data/models/grop_model.dart';

// ignore: non_constant_identifier_names
Widget ListTileItemMember(UserModel model, bool? select) {
  return ListTile(
    contentPadding: const EdgeInsets.all(0),
    leading: CircleAvatar(
      backgroundImage: NetworkImage(model.url!),
      radius: 28,
    ),
    title: Text(
      model.name!,
      style: TextStyleConst.textstyle17.copyWith(color: Colors.black),
    ),
    subtitle: Text(
      model.description!,
      style: TextStyleConst.textstyle16
          .copyWith(color: const Color.fromARGB(255, 128, 126, 126)),
    ),
    trailing: Visibility(
        visible: select == null ? false : select,
        child: CircleAvatar(
            radius: 15,
            backgroundColor: ColorApp.primarycolor,
            child: const Icon(
              Icons.done,
              color: Colors.white,
            ))),
  );
}
