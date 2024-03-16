// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/custom_appBar.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    controller = ScrollController();
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 204, 203, 203),
        body: Stack(
          children: [
            CustomAppBar(
              controller: controller,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                controller: controller,
                reverse: false,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 90,
                      ),
                      Column(
                        children: [BioAndFollowrs()],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class BioAndFollowrs extends StatelessWidget {
  const BioAndFollowrs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(15),
            horizontalTitleGap: 4,
            leading: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red,
            ),
            title: Text(
              "mostafa",
              style: TextStyleConst.textstyle25
                  .copyWith(fontSize: 27, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              "ui/ux designer",
              style: TextStyleConst.textstyle17.copyWith(
                  color: const Color.fromARGB(255, 141, 139, 139), height: .4),
            ),
          ),
          Divider(
            color: ColorApp.greycolor,
            height: 1.4,
            thickness: 1,
          ),
          Container(
            padding: const EdgeInsets.all(18),
            child: Text(
              "hi i name is mostafa iam ui and ux designer iam good in this thing  if you want to learn more about ui and ux please tell me ",
              style: TextStyleConst.textstyle15
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            color: const Color.fromARGB(255, 245, 244, 244),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Follow(434, "puplic post"),
                  Follow(3232, "Followers"),
                  Follow(923, "Following"),
                ]),
          )
        ],
      ),
    );
  }
}

Widget Follow(n, t) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        n.toString(),
        style: TextStyleConst.textstyle16.copyWith(fontWeight: FontWeight.w700),
      ),
      Text(
        t,
        style: TextStyleConst.textstyle15.copyWith(color: Colors.grey),
      ),
    ],
  );
}

class LayouTest extends StatelessWidget {
  const LayouTest({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context1, constrains) {
      if (constrains.maxWidth > 200) {
        return const Center(
          child: Text("widget1"),
        );
      } else {
        return const Center(
          child: Text("widget2"),
        );
      }
    });
  }
}
