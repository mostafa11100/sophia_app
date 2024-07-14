import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/utilits/alertdialog_gineraluse.dart';
import 'package:sophia_chat/utilits/custom_elevated_button.dart';

showdialoglogin(context, bool? error, String content, ontap) {
  // return showDialog(
  //     context: context,
  //     builder: (c) {

  showawesamedialog(
      context: context,
      ontap1: ontap,
      ontap2: null,
      content: content,
      title: null,
      dialogType: error != null ? DialogType.error : DialogType.success);
  //   return AlertDialog(
  //     icon: error != null
  //         ? Icon(
  //             error ? Icons.priority_high : Icons.error,
  //             size: 50,
  //             color: !error ? Colors.red : Colors.yellow,
  //           )
  //         : Icon(
  //             Icons.done,
  //             size: 50,
  //             color: ColorApp.primarycolor,
  //           ),
  //     content: content,
  //     actions: [CustomElevatedbutton(ontap: ontap, text: "ok")],
  //   );
  // });
}
