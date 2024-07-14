import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

AppBar customappbar({UserModel? usermodel}) {
  return AppBar(
    centerTitle: false,
    backgroundColor: ColorApp.primarycolor,
    leading: Builder(builder: (context) {
      return InkWell(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 33,
        ),
      );
    }),
    titleSpacing: 0,
    title: Builder(builder: (context) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              GoRouter.of(context)
                  .push(approuter.profilefriend, extra: usermodel);
            },
            child: CircleAvatar(
                radius: 18, backgroundImage: NetworkImage(usermodel!.url!)),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                usermodel.name!,
                style: TextStyleConst.textstyle22.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                usermodel.online! ? "active now" : "not active",
                style: TextStyleConst.textstyle15.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      );
    }),
    actions: [
      InkWell(
        onTap: () {},
        child: const Icon(
          Icons.phone,
          color: Colors.white,
          size: 28,
        ),
      ),
      const SizedBox(
        width: 15,
      ),
      InkWell(
        onTap: () {},
        child: const Icon(
          Icons.video_call,
          color: Colors.white,
          size: 28,
        ),
      ),
      const SizedBox(
        width: 15,
      ),
      InkWell(
        onTap: () {},
        child: const Icon(
          Icons.error,
          color: Colors.white,
          size: 28,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
    ],
  );
}
