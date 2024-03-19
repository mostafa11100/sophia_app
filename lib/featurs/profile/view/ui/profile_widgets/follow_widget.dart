import 'package:flutter/material.dart';
import 'package:sophia_chat/const/text_style_const.dart';

Widget Follow(n, t) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        n.toString(),
        style: TextStyleConst.textstyle16.copyWith(fontWeight: FontWeight.w700),
      ),
      Text(
        t,
        style: TextStyleConst.textstyle15.copyWith(color: Colors.grey),
      ),
    ],
  );
}
