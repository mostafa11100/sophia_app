import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/seemore.dart';

Widget friendslist() {
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
            height: 60,
            child: ListView.builder(
                padding: EdgeInsetsDirectional.zero,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, i) {
                  if (i == 4) {
                    return Padding(
                      padding: const EdgeInsets.all(3.8),
                      child: seemore(),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.8),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://firebasestorage.googleapis.com/v0/b/sophia-chat.appspot.com/o/profile_photo.PNG?alt=media&token=97cb0f47-420b-4985-8d5e-cfb2b42f8752"),
                            radius: 30,
                          ),
                          Positioned(
                            left: 45,
                            top: 45,
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
                    );
                  }
                }),
          ),
        ],
      ),
    );
  });
}
