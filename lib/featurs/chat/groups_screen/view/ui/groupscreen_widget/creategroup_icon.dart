// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';

Widget CreateGroupeICon() {
  return InkWell(
    onTap: () {},
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: ColorApp.greycolor,
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Create New",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
      ]),
    ),
  );
}
