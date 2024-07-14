import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sophia_chat/const/text_style_const.dart';

Widget bodyofcallscreen_empty(ontap, w) {
  return Container(
    color: Colors.white,
    width: w,
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: w / 2, child: Image.asset("assets/svgcal_emoty.jpg")),
          SizedBox(
            height: 15,
          ),
          Text(
            "No Phone Call",
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
              "Make Phone Call",
              textAlign: TextAlign.center,
              style: TextStyleConst.textstyle17
                  .copyWith(fontWeight: FontWeight.w800, color: Colors.blue),
            ),
          ),
        ]),
  );
}
