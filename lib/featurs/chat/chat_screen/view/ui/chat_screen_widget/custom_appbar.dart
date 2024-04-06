import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';

AppBar customappbar({name = "", state = "", String url = ""}) {
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
          size: 35,
        ),
      );
    }),
    titleSpacing: 0,
    title: Builder(builder: (context) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              GoRouter.of(context).push(approuter.profilefriend);
            },
            child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(url)),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyleConst.textstyle22.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                state,
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
          size: 32,
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
          size: 32,
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
          size: 32,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
    ],
  );
}
