// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';

AppBar AppBarChatCustom(context, tabController) {
  StreamController<bool>? streamController = StreamController<bool>();

  return AppBar(
    backgroundColor: ColorApp.primarycolor,
    title: Text(
      "All Chat",
      style: TextStyleConst.textstyle25.copyWith(color: Colors.white),
    ),
    actions: [
      StreamBuilder<bool>(
          stream: streamController.stream,
          initialData: true,
          builder: (context, snapshot) {
            return Visibility(
              visible: snapshot.data!,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person_add,
                  color: Colors.white,
                ),
              ),
            );
          }),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      )
    ],
    bottom: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: TabBar(
            unselectedLabelColor: const Color.fromARGB(255, 161, 160, 160),
            dividerColor: ColorApp.primarycolor,
            indicatorColor: Colors.white,
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            controller: tabController!,
            onTap: (i) {
              if (i != 0) {
                streamController.add(false);
              } else {
                streamController.add(true);
              }
            },
            tabs: [
              Text(
                "messages",
                style: TextStyleConst.textstyle18.copyWith(color: Colors.white),
              ),
              Text(
                "groups",
                style: TextStyleConst.textstyle18.copyWith(color: Colors.white),
              ),
              Text(
                "calls",
                style: TextStyleConst.textstyle18.copyWith(color: Colors.white),
              )
            ])),
  );
}
