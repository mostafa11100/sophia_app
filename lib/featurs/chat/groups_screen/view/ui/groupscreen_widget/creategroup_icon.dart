// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/const/color_app.dart';

Widget CreateGroupeICon(context, usermodel) {
  return InkWell(
    onTap: () {
      GoRouter.of(context).push(approuter.listoffriends, extra: usermodel);
    },
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: const Color.fromARGB(255, 226, 223, 223),
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
