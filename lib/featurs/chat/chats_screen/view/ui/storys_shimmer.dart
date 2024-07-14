import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

Widget StorysSimmer() {
  return Builder(builder: (context) {
    int d = 0;
    double h = 48, w = 48, s = 6, wi = MediaQuery.of(context).size.width - 340;
    Color color = const Color.fromARGB(134, 255, 255, 255);
    return ShimmerPro.generated(
        depth: d,
        scaffoldBackgroundColor: const Color.fromARGB(0, 255, 255, 255),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 130,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(5, (i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
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
                      width: 60,
                      baseColor: color,
                      radius: 9,
                      highlightColor: const Color.fromARGB(255, 196, 194, 194),
                      fadeTheme: FadeTheme.light,
                    ),
                  ],
                ),
              );
            })),
          ),
        ));
  });
}
