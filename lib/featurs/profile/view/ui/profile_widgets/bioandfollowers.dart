import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_screen.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/follow_widget.dart';

class BioAndFollowrs extends StatelessWidget {
  const BioAndFollowrs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(15),
            horizontalTitleGap: 4,
            leading: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red,
            ),
            title: Text(
              "mostafa",
              style: TextStyleConst.textstyle25
                  .copyWith(fontSize: 27, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              "ui/ux designer",
              style: TextStyleConst.textstyle17.copyWith(
                  color: const Color.fromARGB(255, 141, 139, 139), height: .4),
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
              "hi i name is mostafa iam ui and ux designer iam good in this thing  if you want to learn more about ui and ux please tell me ",
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
                  Follow(434, "puplic post"),
                  Follow(3232, "Followers"),
                  Follow(923, "Following"),
                ]),
          )
        ],
      ),
    );
  }
}
