// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/bioandfollowers.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/custom_appBar.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/custom_gridview.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/friends_list.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ScrollController? controller;
  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 233, 230, 230),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 90,
                      ),
                      Column(
                        children: [
                          const BioAndFollowrs(),
                          friendslist(),
                          customgridview(99)
                        ],
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
