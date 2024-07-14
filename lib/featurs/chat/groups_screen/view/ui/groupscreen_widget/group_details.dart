import 'package:flutter/material.dart';
import 'package:sophia_chat/const/text_style_const.dart';

Widget groupnameanddate(name, date) {
  return Container(
    padding: EdgeInsets.all(18),
    alignment: Alignment.centerLeft,
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "group $name",
          style: TextStyleConst.textstyle15
              .copyWith(color: const Color.fromARGB(255, 58, 57, 57)),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          "made in $date",
          style: TextStyleConst.textstyle15
              .copyWith(color: const Color.fromARGB(255, 100, 100, 100)),
        )
      ],
    ),
  );
}
