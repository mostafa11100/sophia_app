// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({super.key, this.controller});
  ScrollController? controller;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool op = true;
  @override
  void initState() {
    widget.controller!.addListener(() {
      setState(() {
        print(op);

        if (widget.controller!.offset >= 20) {
          op = false;
        } else {
          op = true;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      height: 130,
      width: MediaQuery.of(context).size.width,
      color: ColorApp.primarycolor,
      child: Align(
          alignment: Alignment.topLeft,
          child: Visibility(
              //duration: const Duration(microseconds: 150),
              visible: op,
              child: const Row(
                children: [
                  Text(
                    "My Profile",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 35,
                  )
                ],
              ))),
    );
  }
}
