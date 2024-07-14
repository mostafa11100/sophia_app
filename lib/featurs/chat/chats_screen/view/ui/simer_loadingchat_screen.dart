import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerLoadingChat extends StatelessWidget {
  ShimmerLoadingChat({super.key});
  Color color = const Color.fromARGB(255, 255, 255, 255);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(0),
        child: SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            width: MediaQuery.of(context).size.width,
            child: Column(
                children: List.generate(6, (i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  FadeShimmer(
                    height: 55,
                    width: 55,
                    baseColor: color,
                    //radius: 20,
                    highlightColor: const Color.fromARGB(255, 173, 171, 171),
                    fadeTheme: FadeTheme.light,

                    radius: 48,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeShimmer(
                        height: 10,
                        width: 230,
                        baseColor: color,
                        radius: 9,
                        highlightColor:
                            const Color.fromARGB(255, 209, 208, 208),
                        fadeTheme: FadeTheme.light,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      FadeShimmer(
                        height: 10,
                        width: 180,
                        baseColor: color,
                        radius: 10,
                        highlightColor:
                            const Color.fromARGB(255, 214, 212, 212),
                        fadeTheme: FadeTheme.light,
                      ),
                    ],
                  )
                ]),
              );
            }))));
  }
}
