import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/utilits/alertdialog_gineraluse.dart';
import 'package:sophia_chat/utilits/custom_elevated_button.dart';

showdialog({
  context,
  title,
  Function()? ontap1,
}) {
  showawesamedialog(
      context: context,
      ontap1: ontap1,
      ontap2: null,
      content:
          "Congratulations! Your account has been successfully created. We've sent a verification message to your email. Kindly check your Gmail inbox and proceed to log in again",
      title: title,
      dialogType: DialogType.success);
  // return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Icon(
  //           Icons.check_circle,
  //           size: 70,
  //           color: ColorApp.primarycolor,
  //         ),
  //         content: const Text(
  //             "Congratulations! Your account has been successfully created. We've sent a verification message to your email. Kindly check your Gmail inbox and proceed to log in again"),
  //         actions: [
  //           SizedBox(child: CustomElevatedbutton(ontap: ontap1, text: "ok"))
  //         ],
  //       );
  //     });
}

showdialogofloading(context) {
  return showDialog(
      context: context,
      builder: (c) {
        return Center(
            child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 3.4,
        ));
      });
}

showdialogjustmessage(context, content) {
  return showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          content: Text(content),
          actions: [
            CustomElevatedbutton(
                ontap: () {
                  context.pop();
                },
                text: "ok")
          ],
        );
      });
}
