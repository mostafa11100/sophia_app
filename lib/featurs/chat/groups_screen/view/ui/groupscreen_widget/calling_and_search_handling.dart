import 'package:flutter/material.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/groupscreen_widget/item_of_calling.dart';

Widget callingandsearchandadding_item(groupname, countmembers) {
  return Builder(builder: (context) {
    return Container(
      color: Colors.white,
      height: 210,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            groupname,
            style: TextStyleConst.textstyle20
                .copyWith(fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Group. ",
                style: TextStyleConst.textstyle14.copyWith(
                    fontWeight: FontWeight.w300,
                    color: const Color.fromARGB(255, 117, 116, 116)),
              ),
              Text(
                countmembers.toString(),
                style: TextStyleConst.textstyle14.copyWith(
                    fontWeight: FontWeight.w300,
                    color: const Color.fromARGB(255, 117, 116, 116)),
              ),
              Text(
                "members ",
                style: TextStyleConst.textstyle14.copyWith(
                    fontWeight: FontWeight.w300,
                    color: const Color.fromARGB(255, 117, 116, 116)),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                itemofcalling(Icons.call, "Voice Call"),
                itemofcalling(Icons.video_call_outlined, "Video"),
                itemofcalling(Icons.person_add, "Add"),
                itemofcalling(Icons.search_rounded, "Search")
              ],
            ),
          ),
        ],
      ),
    );
  });
}
