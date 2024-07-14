// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/follow_widget.dart';

class BioAndFollowrs extends StatelessWidget {
  BioAndFollowrs({super.key, required this.usermodel});
  UserModel usermodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              isThreeLine: true,
              //  contentPadding: const EdgeInsets.all(15),
              horizontalTitleGap: 6,
              leading: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 243, 241, 241),
                radius: 30,
                backgroundImage: NetworkImage(usermodel.url!),
              ),
              title: Text(
                usermodel.name!,
                style: TextStyleConst.textstyle25
                    .copyWith(fontSize: 27, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                usermodel.description!,
                style: TextStyleConst.textstyle17.copyWith(
                    color: const Color.fromARGB(255, 141, 139, 139),
                    height: .4),
              ),
            ),
          ),
          Divider(
            color: ColorApp.greycolor,
            height: 1.4,
            thickness: 1,
          ),
          Container(
            padding: const EdgeInsets.all(18),
            child: Text(
              usermodel.bio!,
              style: TextStyleConst.textstyle15
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            color: const Color.fromARGB(255, 245, 244, 244),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Follow(usermodel.puplicpost!.length, "puplic post"),
                  Follow(usermodel.followers!.length, "Followers"),
                  Follow(usermodel.following!.length, "Following"),
                ]),
          )
        ],
      ),
    );
  }
}
