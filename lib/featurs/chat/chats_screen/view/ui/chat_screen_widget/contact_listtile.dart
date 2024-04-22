// ignore_for_file: must_be_immutable

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_chat.dart';
import 'package:sophia_chat/function/convert_temp_totime.dart';

class ListTileOfuser extends StatelessWidget {
  ListTileOfuser({super.key, required this.model});
  final UserAndChatModel model;

  List<Color> listofcolors = [
    ColorApp.greycolor,
    ColorApp.primarycolor,
    Colors.black,
    Colors.red,
  ];
  List<Color> listofcolors2 = [
    ColorApp.greycolor,
    Colors.black,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        height: 65,
        child: ListTile(
          leading: Stack(
            children: [
              CircularProfileAvatar(
                '',
                // borderColor: listofcolors[0],
                //  borderWidth: 2.5,
                radius: 27,
                child: Image.network(
                  model.userModel!.url!,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 40,
                top: 40,
                child: Visibility(
                  visible: true,
                  child: CircleAvatar(
                    backgroundColor: ColorApp.primarycolor,

                    radius: 6,
                    // borderWidth: 2,
                  ),
                ),
              ),
            ],
          ),
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),

          title: SizedBox(
            height: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    model.userModel!.name!,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: ColorApp.primarycolor,
                  ),
                )
              ],
            ),
          ),

          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              model.chatModel!.message![0].message!,
              style: TextStyleConst.textstyle16.copyWith(
                  color: model.chatModel!.message![0].seen == true
                      ? ColorApp.seenmessagecolor
                      : model.chatModel!.message![0].call != true
                          ? Colors.black
                          : Colors.red),
            ),
          ),
          // dense: true,
          isThreeLine: false,
          trailing: SizedBox(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(converttime(model.chatModel!.message![0].time!.toDate()),
                    style: TextStyleConst.textstyle16.copyWith(
                      color: model.chatModel!.message![0].seen == true
                          ? ColorApp.seenmessagecolor
                          : Colors.black,
                    )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: model.chatModel!.message![0].call! &&
                          model.chatModel!.message![0].seen == false
                      ? Icon(
                          Icons.call,
                          color: ColorApp.primarycolor,
                          size: 30,
                        )
                      : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
