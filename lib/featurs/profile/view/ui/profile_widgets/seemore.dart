import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';

Widget seemore() {
  return Builder(builder: (context) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: ColorApp.primarycolor,
      child: Text(
        "+43",
        style: TextStyleConst.textstyle18
            .copyWith(color: Colors.white, fontWeight: FontWeight.normal),
      ),
    );
  });
}
