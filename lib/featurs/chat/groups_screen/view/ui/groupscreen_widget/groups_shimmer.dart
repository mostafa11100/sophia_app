import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

Widget GroupsShimmer() {
  Color color = const Color.fromARGB(0, 255, 255, 255);
  return ShimmerPro.generated(
      scaffoldBackgroundColor: color,
      child: GridView.builder(
          itemCount: 6,
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 7,
            mainAxisSpacing: 8,
            crossAxisCount: 2,
            mainAxisExtent: 200,
          ),
          itemBuilder: (c, i) {
            return groupiconshimmer();
          }));
}

Widget groupiconshimmer() {
  Color color = const Color.fromARGB(172, 255, 255, 255);
  return Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(12)),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.star,
                size: 23,
                color: const Color.fromARGB(200, 158, 158, 158),
              ),
              Icon(
                Icons.more_vert,
                size: 23,
                color: const Color.fromARGB(200, 158, 158, 158),
              )
            ],
          ),
        ),
        FadeShimmer(
          height: 55,
          width: 55,
          baseColor: color,
          //radius: 20,
          highlightColor: const Color.fromARGB(255, 141, 140, 140),
          fadeTheme: FadeTheme.light,

          radius: 48,
        ),
        SizedBox(
          height: 8,
        ),
        FadeShimmer(
          height: 10,
          width: 80,
          baseColor: color,
          radius: 9,
          highlightColor: const Color.fromARGB(255, 196, 194, 194),
          fadeTheme: FadeTheme.light,
        ),
        Align(
          alignment: Alignment.center,
          child: Stack(
            children: List.generate(
              3,
              (index) {
                return Padding(
                  padding:
                      EdgeInsets.only(top: 10, left: (index.toDouble()) * 20),
                  child: ClipRRect(
                    child: FadeShimmer.round(
                      size: 30,
                      baseColor: color,
                      //radius: 20,
                      highlightColor: const Color.fromARGB(255, 141, 140, 140),
                      fadeTheme: FadeTheme.light,
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    ),
  );
}
