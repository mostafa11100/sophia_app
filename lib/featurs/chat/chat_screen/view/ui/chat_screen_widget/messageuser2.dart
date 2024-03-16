// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/time_custom.dart';

class MessageContainerCustomuser2 extends StatelessWidget {
  MessageContainerCustomuser2(
      {super.key,
      required this.url,
      required this.state,
      required this.message});
  String url;
  bool state;
  String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.red,
                  backgroundImage: NetworkImage(url)),
            ),
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 1.5),
              decoration: BoxDecoration(
                color: ColorApp.messagecolor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Text(message,
                  style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Visibility(visible: state, child: timewidget()),
        )
      ],
    );
  }
}
