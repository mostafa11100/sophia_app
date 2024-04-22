import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

Widget friendslistwidget(List<UserModel> listoffriends) {
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
                itemCount: listoffriends.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.8),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(listoffriends[i].url!),
                          radius: 26,
                        ),
                        Positioned(
                            left: 39,
                            top: 338,
                            child: CircleAvatar(
                              radius: 4,
                              backgroundColor: listoffriends[i].online!
                                  ? ColorApp.primarycolor
                                  : ColorApp.greycolor,
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
