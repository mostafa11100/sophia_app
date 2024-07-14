import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';

alertdialogerror(context, error, ontap()) {
  showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/networkerror.PNG'),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Network Error",
                  style: TextStyleConst.textstyle26,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  error,
                  maxLines: 1,
                  style: TextStyleConst.textstyle14.copyWith(
                      color: const Color.fromARGB(255, 146, 146, 146)),
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: ontap,
                    child: Text(
                      "Retry Connection",
                      style: TextStyleConst.textstyle16
                          .copyWith(color: ColorApp.primarycolor),
                    ))
              ],
            ),
          ),
        );
      });
}
