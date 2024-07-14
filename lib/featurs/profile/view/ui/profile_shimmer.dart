import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/follow_widget.dart';

Widget ProfleShimmer() {
  return Stack(
    children: [bioandfollowersshimmer()],
  );
}

Widget bioandfollowersshimmer() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(5)),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListTile(
            isThreeLine: true,
            //  contentPadding: const EdgeInsets.all(15),
            horizontalTitleGap: 6,
            leading: FadeShimmer.round(
              size: 55,
              baseColor: Colors.white,
              highlightColor: Colors.white,
              fadeTheme: FadeTheme.light,
            ),

            title: Align(
              alignment: Alignment.centerLeft,
              child: FadeShimmer(
                radius: 8,
                baseColor: Colors.white,
                highlightColor: Colors.white,
                fadeTheme: FadeTheme.light,
                width: 160,
                height: 10,
              ),
            ),
            subtitle: Align(
              alignment: Alignment.centerLeft,
              child: FadeShimmer(
                radius: 8,
                baseColor: Colors.white,
                highlightColor: Colors.white,
                fadeTheme: FadeTheme.light,
                width: 120,
                height: 10,
              ),
            ),
          ),
        ),
        Divider(
          color: ColorApp.greycolor,
          height: 1.4,
          thickness: 1,
        ),
        Container(
          height: 150,
          padding: const EdgeInsets.all(18),
          //  child: FadeShimmer(
          //   radius: 8,
          //   baseColor: Colors.white,
          //   highlightColor: Colors.white,
          //   fadeTheme: FadeTheme.light,
          //   width: 250,
          //   height: 50,
          // ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          color: const Color.fromARGB(255, 245, 244, 244),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Follow("", "puplic post"),
                Follow("", "Followers"),
                Follow("", "Following"),
              ]),
        )
      ],
    ),
  );
}
