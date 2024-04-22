import 'package:flutter/material.dart';
import 'package:sophia_chat/const/text_style_const.dart';

Widget typeoffile(
    {required String? title,
    required Function()? ontap,
    required Widget? icon,
    required Color color}) {
  return InkWell(
    hoverColor: const Color.fromARGB(255, 105, 104, 104),
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: color,
            child: Center(child: icon),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            title!,
            style: TextStyleConst.textstyle15
                .copyWith(fontWeight: FontWeight.w800),
          )
        ],
      ),
    ),
  );
}
