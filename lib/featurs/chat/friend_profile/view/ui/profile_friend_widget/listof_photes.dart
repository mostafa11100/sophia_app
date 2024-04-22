import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

Widget photos(List<PublicPostModel>? listofimages) {
  return Builder(builder: (context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
          child: Row(
            children: [
              Text(
                "Photos",
                style: TextStyleConst.textstyle17
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              Text(
                "See all",
                style: TextStyleConst.textstyle16
                    .copyWith(color: Colors.blue, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: listofimages!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, i) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(listofimages[i].imgurl!)),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  });
}
