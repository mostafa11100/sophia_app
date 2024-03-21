import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/seemore.dart';

Widget friendslistwidget() {
  return Builder(builder: (context) {
    return Container(
      //  height: 100,
      width: MediaQuery.of(context).size.width,

      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Friends",
                style: TextStyleConst.textstyle17
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                "see all",
                style: TextStyleConst.textstyle17.copyWith(
                    color: const Color.fromARGB(255, 22, 131, 221),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 55,
            child: ListView.builder(
                padding: EdgeInsetsDirectional.zero,
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.8),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://firebasestorage.googleapis.com/v0/b/sophia-chat.appspot.com/o/profile_photo.PNG?alt=media&token=97cb0f47-420b-4985-8d5e-cfb2b42f8752"),
                          radius: 26,
                        ),
                        Positioned(
                            left: 40,
                            top: 39,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: ColorApp.primarycolor,
                            ))
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  });
}
