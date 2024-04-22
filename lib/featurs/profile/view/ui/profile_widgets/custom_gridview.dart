import 'package:flutter/material.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

Widget customgridview({required UserModel usermodel}) {
  return Builder(builder: (context) {
    return usermodel.puplicpost!.isEmpty
        ? const Center(
            child: Text("empty"),
          )
        : Container(
            //   padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "Photos",
                        style: TextStyleConst.textstyle18
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Text(
                        "see all",
                        style: TextStyleConst.textstyle18.copyWith(
                            color: Colors.blue, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.5),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                NetworkImage(usermodel.puplicpost![0].imgurl!),
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        height: (MediaQuery.of(context).size.width / 2) - 42,
                        width: (MediaQuery.of(context).size.width / 2) - 42,
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 42,
                      child: GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: usermodel.puplicpost!.length > 4
                              ? 4
                              : usermodel.puplicpost!.length - 1,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 2,
                                  crossAxisSpacing: 2),
                          itemBuilder: (c, i) {
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      usermodel.puplicpost![i + 1].imgurl!),
                                ),
                                borderRadius: BorderRadius.circular(3.5),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.2),
                    child: GridView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        shrinkWrap: true,
                        itemCount: usermodel.puplicpost!.length > 5
                            ? usermodel.puplicpost!.length - 5
                            : 0,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1,
                                crossAxisCount: 4,
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 3),
                        itemBuilder: (c, i) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    usermodel.puplicpost![i + 5].imgurl!),
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ));
  });
}
