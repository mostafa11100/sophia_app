import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

Widget topresult({required List<UserModel> listofusermodel}) {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Top Result",
                style: TextStyleConst.textstyle18.copyWith(
                    color: const Color.fromARGB(255, 182, 180, 180),
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: ListView.builder(
                  itemCount: listofusermodel.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        GoRouter.of(context).push(approuter.profilefriend,
                            extra: listofusermodel[i]);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromARGB(255, 197, 194, 194),
                                    width: 1.1))),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              size: 31,
                              color: Color.fromARGB(255, 134, 134, 134),
                            ),
                            Text(
                              listofusermodel[i].name!,
                              style: TextStyleConst.textstyle18.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              listofusermodel[i].description!,
                              style: TextStyleConst.textstyle18.copyWith(
                                  color:
                                      const Color.fromARGB(255, 182, 180, 180),
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  });
}
