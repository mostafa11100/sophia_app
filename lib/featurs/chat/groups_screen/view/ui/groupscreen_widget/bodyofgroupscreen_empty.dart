import 'package:flutter/material.dart';

import 'package:sophia_chat/const/text_style_const.dart';

Widget bodyofgroupscreen_empty(ontap, w) {
  return Container(
    color: Colors.white,
    width: w,
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: w / 1, child: Image.asset("assets/svg_emptygroup.webp")),
          SizedBox(
            height: 15,
          ),
          Text(
            "No Group Chat",
            style: TextStyleConst.textstyle23
                .copyWith(fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            width: w / 1.5,
            child: Text(
              "you did't made any conversation yet please select username",
              textAlign: TextAlign.center,
              style: TextStyleConst.textstyle15.copyWith(
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 97, 96, 96)),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: ontap,
            child: Text(
              "Create Group",
              textAlign: TextAlign.center,
              style: TextStyleConst.textstyle17
                  .copyWith(fontWeight: FontWeight.w800, color: Colors.blue),
            ),
          ),
        ]),
  );
}
