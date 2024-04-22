import 'dart:io';

import 'package:flutter/material.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';

Widget recordicon(
    {required String? title,
    required Function(File soundFile, String _time)? ontap,
    required Color color}) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMediaRecorder(
          radius: BorderRadius.circular(40),
          initRecordPackageWidth: 50,
          fullRecordPackageHeight: 50,
          backGroundColor: ColorApp.primarycolor,
          recordIcon: const Icon(
            Icons.mic,
            size: 30,
            color: Colors.white,
          ),
          // maxRecordTimeInSecond: 5,
          startRecording: () {
            // function called when start recording
          },
          stopRecording: (_time) {
            // function called when stop recording, return the recording time
          },
          sendRequestFunction: ontap!,
          encode: AudioEncoderType.AAC,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          title!,
          style:
              TextStyleConst.textstyle15.copyWith(fontWeight: FontWeight.w800),
        )
      ],
    ),
  );
}
