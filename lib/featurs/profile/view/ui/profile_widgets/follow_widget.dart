import 'package:flutter/material.dart';
import 'package:sophia_chat/const/text_style_const.dart';

Widget Follow(n, t) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        n.toString(),
        style: TextStyleConst.textstyle17.copyWith(fontWeight: FontWeight.w900),
      ),
      Text(
        t,
        style: TextStyleConst.textstyle16
            .copyWith(color: Colors.grey, fontWeight: FontWeight.w600),
      ),
    ],
  );
}
