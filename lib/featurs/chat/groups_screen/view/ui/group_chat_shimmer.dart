import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/shimmer_chatscreen.dart';

class ShimmerGroupChat extends StatelessWidget {
  const ShimmerGroupChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primarycolor,
        leading: InkWell(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 35,
          ),
        ),
        title: FadeShimmer.round(
          size: 40,
          baseColor: Colors.white,
          highlightColor: const Color.fromARGB(255, 110, 110, 110),
          fadeTheme: FadeTheme.light,
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.phone,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.video_call,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.error,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: shimmerChatscreen(),
    );
  }
}
