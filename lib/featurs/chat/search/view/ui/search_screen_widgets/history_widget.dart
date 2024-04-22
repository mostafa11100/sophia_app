import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

Widget historyofsearch({required List<UserModel> listofusermodel, ontap}) {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.5,
        child: ListView.builder(
            itemCount: listofusermodel.length,
            itemBuilder: (context, i) {
              return InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  GoRouter.of(context)
                      .push(approuter.profilefriend, extra: listofusermodel[i]);
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(listofusermodel[i].url!),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        listofusermodel[i].name!,
                        style: TextStyleConst.textstyle18.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        listofusermodel[i].description!,
                        style: TextStyleConst.textstyle18.copyWith(
                            color: const Color.fromARGB(255, 182, 180, 180),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  });
}
