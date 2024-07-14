import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';

Widget itemofcalling(icondata, name) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        height: 100,
        width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: const Color.fromARGB(255, 95, 94, 94),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icondata,
              size: 27,
              color: ColorApp.primarycolor,
            ),
            Text(
              name.toString(),
              style: TextStyleConst.textstyle16
                  .copyWith(fontWeight: FontWeight.normal),
            )
          ],
        )),
  );
}
