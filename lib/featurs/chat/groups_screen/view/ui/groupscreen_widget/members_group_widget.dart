import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

Widget membersgrup(UserModel usermodel, String job) {
  return Builder(builder: (context) {
    return SizedBox(
      // height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        isThreeLine: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.4),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(usermodel.url!),
            ),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
          child: Text(
            usermodel.name!,
            style: TextStyleConst.textstyle16,
          ),
        ),
        trailing: job == ""
            ? null
            : Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                color: const Color.fromARGB(255, 218, 235, 218).withOpacity(.3),
                child: Text(
                  job,
                  style: TextStyleConst.textstyle16.copyWith(
                      color: const Color.fromARGB(255, 102, 101, 101)),
                ),
              ),
      ),
    );
  });
}
