import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';

class MessageFile extends StatelessWidget {
  MessageFile(
      {super.key,
      required this.url,
      required this.user1,
      required this.message});
  String url;

  bool user1;
  String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorApp.primarycolor2,
          borderRadius: BorderRadius.only(
            topLeft:
                user1 ? const Radius.circular(15) : const Radius.circular(1),
            topRight: const Radius.circular(15),
            bottomLeft: const Radius.circular(15),
            bottomRight:
                user1 ? const Radius.circular(1) : const Radius.circular(15),
          ),
          border: Border.all(color: ColorApp.primarycolor)),
      //height: 80,
      // width: MediaQuery.of(context).size.width / 2.1,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              // color: Colors.red,
              width: MediaQuery.of(context).size.width / 1.7,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "file 2883 j_kdso",
                    style: TextStyleConst.textstyle17.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.file_copy,
                    color: Color.fromARGB(255, 161, 159, 159),
                    size: 40,
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: ColorApp.primarycolor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(15),
                    bottomRight: user1
                        ? const Radius.circular(1)
                        : const Radius.circular(15),
                  ),
                  border: Border.all(color: ColorApp.primarycolor)),
              padding: const EdgeInsets.all(5),
              // constraints: BoxConstraints(minHeight: 1),
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width / 1.7,
              //height: message == "" ? 1 : null,
              child: Text(
                message,
                style: TextStyleConst.textstyle17.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: message == "" ? 0.1 : 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
