import 'package:flutter/material.dart';
import 'package:sophia_chat/const/text_style_const.dart';

Widget titleofbodyrow(Stream<bool> stream) {
  return Row(
    children: [
      Text(
        "Recent Search",
        style: TextStyleConst.textstyle17.copyWith(
            fontWeight: FontWeight.w800,
            color: const Color.fromARGB(255, 182, 180, 180)),
      ),
      const Spacer(),
      StreamBuilder<bool>(
          initialData: true,
          stream: stream,
          builder: (context, snapshot) {
            return Visibility(
              visible: snapshot.data!,
              child: Text(
                "Clear history",
                style: TextStyleConst.textstyle17
                    .copyWith(fontWeight: FontWeight.w800, color: Colors.blue),
              ),
            );
          })
    ],
  );
}
