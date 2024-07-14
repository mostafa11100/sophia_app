import 'package:flutter/material.dart';
import 'package:sophia_chat/const/text_style_const.dart';

itemofsetting(
    {required String title,
    required Function() ontap,
    required IconData icondata,
    required Color iconcolor}) {
  return StatefulBuilder(builder: (context, setstate) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: InkWell(
        onTap: ontap,
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
            InkWell(
              onTap: ontap,
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Color.fromARGB(255, 126, 125, 125),
              ),
            )
          ],
        ),
      ),
    );
  });
}
