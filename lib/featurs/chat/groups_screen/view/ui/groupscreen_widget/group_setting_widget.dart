import 'package:flutter/material.dart';
import 'package:sophia_chat/featurs/settings/view/settings_screen/Setting_screen_widgets/itemofsetting_with_sweach.dart';

Widget groupsetting(addothersmembers, sendmessage) {
  return Container(
    height: 150,
    color: Colors.white,
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        itemofsettingwithswitch(
            title: "send messages",
            swich: sendmessage!,
            ontap: (bool swich) {
              sendmessage = swich;
            },
            icondata: Icons.message_rounded,
            iconcolor: const Color.fromRGBO(129, 128, 128, 1)),
        itemofsettingwithswitch(
            title: "adding other members",
            swich: addothersmembers,
            ontap: (bool swich) {
              addothersmembers = swich;
            },
            icondata: Icons.person_add,
            iconcolor: const Color.fromARGB(255, 129, 128, 128)),
      ],
    ),
  );
}
