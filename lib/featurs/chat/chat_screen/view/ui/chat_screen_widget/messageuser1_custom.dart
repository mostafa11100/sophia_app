// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sophia_chat/class/voice_message.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/message_file.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/message_image.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/chat_model.dart';
import 'package:sophia_chat/function/convert_temp_totime.dart';

class MessageContainerCustomuser1 extends StatelessWidget {
  MessageContainerCustomuser1(
      {super.key, required this.message, required this.type});
  String type;
  MessageModel message;
  @override
  Widget build(BuildContext context) {
    if (type == "message")
      // ignore: curly_braces_in_flow_control_structures
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width / 1.5),
            decoration: BoxDecoration(
              color: ColorApp.primarycolor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              message.message!,
              style: TextStyleConst.textstyle16.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    // ignore: curly_braces_in_flow_control_structures
    else if (type == "file") {
      return Align(
        alignment: Alignment.centerRight,
        child: MessageFile(
          url: message.url!,
          user1: true,
          message: message.message!,
        ),
      );
    } else if (type == "images" || type == "gif") {
      return Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          child: Messageimage(
            url: message.url!,
            user1: true,
            message: message.message!,
          ),
        ),
      );
    } else {
      return Align(
          alignment: Alignment.centerRight,
          child: voicemessage(
              true,
              "https://firebasestorage.googleapis.com/v0/b/sophia-chat.appspot.com/o/profile_photo.PNG?alt=media&token=97cb0f47-420b-4985-8d5e-cfb2b42f8752",
              message.url,
              converttime(message.time!.toDate())));
    }
  }
}
