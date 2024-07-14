import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/data/models/grop_model.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/groupscreen_widget/group_member_images_list.dart';

Widget GroupIcon(GroupModel model) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Color.fromARGB(255, 107, 105, 105),
            ),
            const Spacer(),
            PopupMenuButton(
                child: const Icon(Icons.more_vert_outlined),
                itemBuilder: (c) {
                  return <PopupMenuEntry>[
                    const PopupMenuItem(
                      child: Text("item1"),
                    ),
                    const PopupMenuItem(
                      child: Text("item2"),
                    ),
                    const PopupMenuItem(
                      child: Text("item3"),
                    )
                  ];
                }),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Stack(
          children: [
            CircularProfileAvatar(model.image!,
                backgroundColor: ColorApp.greycolor,
                radius: 33,
                borderWidth: 2.3,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 33,
                  backgroundImage: NetworkImage(model.image!),
                )),
            Positioned(
              left: 48,
              top: 48,
              child: Visibility(
                visible: true,
                child: CircleAvatar(
                  backgroundColor: ColorApp.primarycolor,

                  radius: 7,
                  // borderWidth: 2,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          model.name!,
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        const SizedBox(
          height: 10,
        ),
        GroupMemberImagesList(model.members)
      ],
    ),
  );
}
