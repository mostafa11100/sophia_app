import 'package:flutter/material.dart';
import 'package:sophia_chat/const/text_style_const.dart';

Widget timewidget({time = "20m"}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        time,
        style: TextStyleConst.textstyle12
            .copyWith(color: const Color.fromARGB(255, 129, 128, 128)),
      ),
      const SizedBox(
        width: 2,
      ),
      const Icon(
        Icons.message,
        size: 20,
        color: Color.fromARGB(255, 129, 128, 128),
      )
    ],
  );
}
