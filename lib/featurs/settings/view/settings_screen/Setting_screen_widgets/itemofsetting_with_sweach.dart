import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';

itemofsettingwithswitch(
    {required String title,
    required bool swich,
    required Function(bool swich) ontap,
    required IconData icondata,
    required Color iconcolor}) {
  return StatefulBuilder(builder: (context, setstate) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: iconcolor,
            child: Icon(
              icondata,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: TextStyleConst.textstyle17,
          ),
          const Spacer(),
          Switch(
              trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return ColorApp.primarycolor;
                }

                return const Color.fromARGB(255, 212, 210, 210);
              }),
              inactiveThumbColor: Colors.white,
              activeTrackColor: ColorApp.primarycolor,
              inactiveTrackColor: const Color.fromARGB(255, 212, 210, 210),
              // activeColor: ColorApp.primarycolor,

              value: swich,
              onChanged: (val) {
                setstate(() {
                  swich = val;
                  ontap(swich);
                });
              })
        ],
      ),
    );
  });
}
