import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

Widget customgridview({required UserModel usermodel}) {
  return Builder(builder: (context) {
    return Container(
        constraints: BoxConstraints(minHeight: 150),
        //   padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Photos",
                    style: TextStyleConst.textstyle18
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  Text(
                    "See All",
                    style: TextStyleConst.textstyle18.copyWith(
                        color: Colors.blue, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            SizedBox(
                child: usermodel.puplicpost!.isEmpty
                    ? null
                    : bodyofimagespost(usermodel, context))
          ],
        ));
  });
}

Widget viewimagecustom(url) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(3.5),
    child: InstaImageViewer(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        child: Image(
          image: NetworkImage(url),
          fit: BoxFit.fitWidth,
        )
        //  Image(
        //     fit: BoxFit.fitWidth,
        //     frameBuilder: (BuildContext context, Widget child, int? frame,
        //         bool? wasSynchronouslyLoaded) {
        //       if (wasSynchronouslyLoaded!) {
        //         return child;
        //       }

        //       return AnimatedSwitcher(
        //         duration: const Duration(seconds: 1),
        //         child: frame == null
        //             ? Container(
        //                 color: const Color.fromARGB(255, 255, 254, 254),
        //                 height: 250,
        //                 child: const Center(),
        //               )
        //             : child,
        //       );
        //     },
        //     loadingBuilder: (context, child, event) {
        //       if (event != null) {
        //         return AnimatedSwitcher(
        //             duration: const Duration(seconds: 1),
        //             child: Container(
        //               color: const Color.fromARGB(255, 255, 254, 254),
        //               height: 250,
        //               child: const Center(),
        //             ));
        //       }

        //       return child;
        //     },
        //     //fit: BoxFit.cover,
        //     image: NetworkImage(url)),
        ),
  );
}

Widget bodyofimagespost(UserModel? usermodel, context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
              ),
              height: (MediaQuery.of(context).size.width / 2) - 42,
              width: (MediaQuery.of(context).size.width / 2) - 42,
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(7)),
                  child: viewimagecustom(usermodel!.puplicpost![0])),
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 3),
                itemBuilder: (c, i) {
                  return Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: viewimagecustom(usermodel.puplicpost![i + 1]!),
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 4,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 3),
              itemBuilder: (c, i) {
                return Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: viewimagecustom(usermodel.puplicpost![i + 5]),
                );
              }),
        ),
      )
    ],
  );
}
