import 'package:flutter/material.dart';
import 'package:sophia_chat/const/text_style_const.dart';

Widget customgridview(model) {
  double ii = 100;
  return Builder(builder: (context) {
    return Container(
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
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://firebasestorage.googleapis.com/v0/b/sophia-chat.appspot.com/o/empty.PNG?alt=media&token=1cea72c5-8e69-453e-958a-24a7fdea8ee7"),
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
                      itemCount: model > 4 ? 4 : model - 1,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1,
                              crossAxisCount: 2,
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 2),
                      itemBuilder: (c, i) {
                        return Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://firebasestorage.googleapis.com/v0/b/sophia-chat.appspot.com/o/empty.PNG?alt=media&token=1cea72c5-8e69-453e-958a-24a7fdea8ee7"),
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
                    itemCount: model > 5 ? model - 5 : 0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1,
                            crossAxisCount: 4,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 3),
                    itemBuilder: (c, i) {
                      return Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://firebasestorage.googleapis.com/v0/b/sophia-chat.appspot.com/o/profile_photo.PNG?alt=media&token=97cb0f47-420b-4985-8d5e-cfb2b42f8752"),
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
