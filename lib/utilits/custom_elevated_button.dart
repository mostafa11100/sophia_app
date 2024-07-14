// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';

class CustomElevatedbutton extends StatelessWidget {
  CustomElevatedbutton({super.key, required this.ontap, required this.text});

  void Function()? ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 18,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              disabledBackgroundColor: const Color.fromARGB(255, 105, 105, 105),
              backgroundColor: ColorApp.primarycolor),
          onPressed: ontap,
          child: Text(
            text,
            style: TextStyleConst.textstyle16.copyWith(color: Colors.white),
          )),
    );
  }
}
