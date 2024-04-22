import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/seemore.dart';

Widget friendslist(List<UserModel> listoffriends) {
  return Builder(builder: (context) {
    return Container(
      //  height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.symmetric(vertical: 8),
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
            child: Center(
              child: ListView.builder(
                  padding: EdgeInsetsDirectional.zero,
                  itemCount:
                      listoffriends.length > 6 ? 6 : listoffriends.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (c, i) {
                    if (i == 5) {
                      return Padding(
                        padding: const EdgeInsets.all(3),
                        child: seemore(listoffriends.length - 6),
                      );
                    } else {
                      return InkWell(
                        onTap: () {
                          GoRouter.of(context).push(approuter.profilefriend,
                              extra: listoffriends[i]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    //listoffriends[i].url!
                                    listoffriends[i].url!),
                                radius: 30,
                              ),
                              Positioned(
                                  left: 40,
                                  top: 44,
                                  child: CircleAvatar(
                                    radius: 6,
                                    backgroundColor: listoffriends[i].online!
                                        ? ColorApp.primarycolor
                                        : ColorApp.greycolor,
                                  ))
                            ],
                          ),
                        ),
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  });
}
