import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/utilits/custom_elevated_button.dart';

showdialoglogin(context, bool? error, Widget content, ontap) {
  return showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          icon: error != null
              ? Icon(
                  error ? Icons.priority_high : Icons.error,
                  size: 50,
                  color: !error ? Colors.red : Colors.yellow,
                )
              : Icon(
                  Icons.done,
                  size: 50,
                  color: ColorApp.primarycolor,
                ),
          content: content,
          actions: [CustomElevatedbutton(ontap: ontap, text: "ok")],
        );
      });
}
