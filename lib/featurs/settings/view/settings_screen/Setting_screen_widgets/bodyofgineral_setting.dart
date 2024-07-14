import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/settings/view/settings_screen/Setting_screen_widgets/itemofsetting_with_sweach.dart';
import 'package:sophia_chat/featurs/settings/view/settings_screen/Setting_screen_widgets/itemofsettingscreen.dart';
import 'package:sophia_chat/featurs/settings/view/settings_screen/Setting_screen_widgets/simple_item_ofsetting.dart';

bodyofsettingitems(context, UserModel usermodel) {
  return Column(
    children: [
      Expanded(
        child: Card(
          //   color: Colors.red,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            //  height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                itemofsettingwithswitch(
                    title: "Dark mode",
                    swich: false,
                    ontap: (swich) {},
                    icondata: Icons.dark_mode,
                    iconcolor: Colors.black),
                itemofsettingwithswitch(
                    title: "Profile Lock",
                    swich: false,
                    ontap: (swich) {},
                    icondata: Icons.person,
                    iconcolor: ColorApp.primarycolor),
                itemofsetting(
                    title: "Profile Eddite",
                    ontap: () {
                      GoRouter.of(context)
                          .push(approuter.profileedite, extra: usermodel);
                    },
                    icondata: Icons.edit,
                    iconcolor: Colors.green),
                itemofsetting(
                    title: "Chat Customize",
                    ontap: () {},
                    icondata: Icons.forum_rounded,
                    iconcolor: Colors.blue),
                itemofsetting(
                    title: "Notfication",
                    ontap: () {},
                    icondata: Icons.notifications_active,
                    iconcolor: const Color.fromARGB(255, 231, 62, 118)),
                itemofsetting(
                    title: "Privacy",
                    ontap: () {},
                    icondata: Icons.privacy_tip,
                    iconcolor: Colors.purple)
              ],
            ),
          ),
        ),
      ),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              simpleitemofsetting(
                  ontap: () {},
                  title: "LogOut",
                  icondata: Icons.lock,
                  iconcolor: Colors.orange),
              simpleitemofsetting(
                  textstyle:
                      TextStyleConst.textstyle17.copyWith(color: Colors.red),
                  ontap: () {},
                  title: "Delete Acount",
                  icondata: Icons.person,
                  iconcolor: const Color.fromARGB(255, 221, 59, 48)),
            ],
          ),
        ),
      )
    ],
  );
}
