// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';

class MessageContainerCustomuser1 extends StatelessWidget {
  String message;
  MessageContainerCustomuser1({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.5),
          decoration: BoxDecoration(
            color: ColorApp.primarycolor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Text(
            message,
            style: TextStyleConst.textstyle16.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
