import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';

class Messageimage extends StatelessWidget {
  Messageimage(
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
          borderRadius: BorderRadius.only(
            topLeft:
                user1 ? const Radius.circular(15) : const Radius.circular(1),
            topRight: const Radius.circular(15),
            bottomLeft: const Radius.circular(15),
            bottomRight:
                user1 ? const Radius.circular(1) : const Radius.circular(15),
          ),
          border: Border.all(color: ColorApp.primarycolor)),
      //   height: 180,
      // width: MediaQuery.of(context).size.width / 2.1,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: user1
                      ? const Radius.circular(15)
                      : const Radius.circular(1),
                  topRight: const Radius.circular(15),
                  // bottomLeft: const Radius.circular(10),
                  // bottomRight: user1
                  //     ? const Radius.circular(1)
                  //     : const Radius.circular(15),
                ),
              ),
              height: 250,
              width: MediaQuery.of(context).size.width / 1.7,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: user1
                      ? const Radius.circular(15)
                      : const Radius.circular(1),
                  topRight: const Radius.circular(15),
                  // bottomLeft: const Radius.circular(10),
                  // bottomRight: user1
                  //     ? const Radius.circular(1)
                  //     : const Radius.circular(15),
                ),
                child: InstaImageViewer(
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(url),
                  ),
                ),
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
              padding: EdgeInsets.all(5),
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
