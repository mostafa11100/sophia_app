// ignore_for_file: must_be_immutable

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/story_icon_model.dart';

class CustomCircleAvatarOfStory extends StatelessWidget {
  CustomCircleAvatarOfStory(
      {super.key,
      required this.models,
      required this.child,
      required this.ontap,
      required this.visible});
  bool visible;
  Widget child;
  StoryModel models;
  Function() ontap;

  List<Color> listofcolors = [
    ColorApp.greycolor,
    ColorApp.primarycolor,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 140,
        child: Column(
          children: [
            InkWell(
              onTap: ontap,
              child: Stack(
                children: [
                  CircularProfileAvatar("",
                      backgroundColor: ColorApp.greycolor,
                      borderColor: models.state!
                          ? ColorApp.primarycolor
                          : ColorApp.greycolor,
                      radius: 30,
                      borderWidth: 2.3,
                      child: child),
                  Positioned(
                    left: 45,
                    top: 45,
                    child: Visibility(
                      visible: visible,
                      child: CircleAvatar(
                        backgroundColor:
                            models.state! ? ColorApp.primarycolor : Colors.grey,

                        radius: 7,
                        // borderWidth: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              models.name!,
              style: TextStyleConst.textstyle14.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
