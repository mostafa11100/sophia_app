import 'package:flutter/material.dart';
import 'package:fade_shimmer/fade_shimmer.dart';

Widget shimmerChatscreen() {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 115,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            rightshimmermessage(context),
            SizedBox(
              height: 30,
            ),
            leftshimmermessage(context),
            SizedBox(
              height: 30,
            ),
            rightshimmermessage(context),
            SizedBox(
              height: 30,
            ),
            Spacer(),
            sendingmessageshimmer(context),
          ],
        ),
      ),
    );
  });
}

Widget leftshimmermessage(context) {
  Color color = const Color.fromARGB(255, 172, 171, 171);
  double h = 55, w = MediaQuery.of(context).size.width / 1.2;
  double h2 = 52, w2 = MediaQuery.of(context).size.width / 2;
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      FadeShimmer.round(
        size: 40, baseColor: color,
        //radius: 20,

        highlightColor: const Color.fromARGB(255, 196, 194, 194),
        fadeTheme: FadeTheme.light,
      ),
      SizedBox(
        width: 8,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: FadeShimmer(
              height: h,
              width: w,
              baseColor: color,
              //radius: 20,
              highlightColor: const Color.fromARGB(255, 196, 194, 194),
              fadeTheme: FadeTheme.light,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(1),
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: FadeShimmer(
              height: h2,
              width: w2,
              baseColor: color,
              highlightColor: const Color.fromARGB(255, 196, 194, 194),
              fadeTheme: FadeTheme.light,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          FadeShimmer(
            height: 12,
            width: 80,
            baseColor: color,
            highlightColor: const Color.fromARGB(255, 201, 199, 199),
            fadeTheme: FadeTheme.light,
          )
        ],
      ),
    ],
  );
}

Widget rightshimmermessage(context) {
  Color color = const Color.fromARGB(255, 119, 118, 118);
  double h = 55, w = MediaQuery.of(context).size.width / 1.2;
  double h2 = 52, w2 = MediaQuery.of(context).size.width / 2;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(0),
          topRight: Radius.circular(20),
        ),
        child: FadeShimmer(
          height: h,
          width: w,
          baseColor: color,
          //radius: 20,
          highlightColor: const Color.fromARGB(255, 196, 194, 194),
          fadeTheme: FadeTheme.light,
        ),
      ),
      SizedBox(
        height: 8,
      ),
      ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
        child: FadeShimmer(
          height: h2,
          width: w2,
          baseColor: color,
          highlightColor: const Color.fromARGB(255, 196, 194, 194),
          fadeTheme: FadeTheme.light,
        ),
      ),
      SizedBox(
        height: 8,
      ),
      FadeShimmer(
        height: 12,
        width: 80,
        baseColor: color,
        highlightColor: const Color.fromARGB(255, 196, 194, 194),
        fadeTheme: FadeTheme.light,
      )
    ],
  );
}

Widget sendingmessageshimmer(context) {
  Color color = const Color.fromARGB(255, 172, 171, 171);
  double h = 50, w = MediaQuery.of(context).size.width - 100;
  double w2 = MediaQuery.of(context).size.width;
  return SizedBox(
    width: w2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeShimmer.round(
          size: 45, baseColor: color,
          //radius: 20,

          highlightColor: const Color.fromARGB(255, 196, 194, 194),
          fadeTheme: FadeTheme.light,
        ),
        SizedBox(
          width: 8,
        ),
        FadeShimmer(
          height: h,
          width: w,
          radius: 20,
          baseColor: color,
          highlightColor: const Color.fromARGB(255, 196, 194, 194),
          fadeTheme: FadeTheme.light,
        ),
      ],
    ),
  );
}
