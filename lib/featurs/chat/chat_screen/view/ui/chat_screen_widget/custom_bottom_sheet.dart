// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/repo_sendfile/repo_imp_sendimage_video.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/cubit/cubitsendfiles/cubit/send_files_cubit.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/type_of_file_icon.dart';
import 'package:sophia_chat/function/gallery_pick.dart';

Widget bottomshet(id) {
  List<MediaFile> selectedMedias = [];
  return Builder(builder: (context) {
    return BlocProvider(
      create: (context) => SendFilesCubit(),
      child: Builder(builder: (context) {
        return Container(
          constraints: const BoxConstraints(maxHeight: 130),
          // padding: const EdgeInsets.symmetric(vertical: 15),
          color: ColorApp.greycolor,
          child: Center(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 5),
              scrollDirection: Axis.horizontal,
              children: [
                typeoffile(
                    title: 'Audio',
                    ontap: () {},
                    icon: const Icon(
                      Icons.mic,
                      size: 35,
                      color: Colors.white,
                    ),
                    color: ColorApp.primarycolor),
                typeoffile(
                    title: 'Plan',
                    ontap: () {},
                    icon: const Icon(
                      Icons.redeem,
                      size: 35,
                      color: Colors.white,
                    ),
                    color: Colors.orange),
                typeoffile(
                    title: 'Gif',
                    ontap: () {},
                    icon: const Icon(
                      Icons.gif,
                      size: 50,
                      color: Colors.white,
                    ),
                    color: const Color.fromARGB(255, 255, 115, 0)),
                typeoffile(
                    title: 'Location',
                    ontap: () {},
                    icon: const Icon(
                      Icons.location_on,
                      size: 35,
                      color: Colors.white,
                    ),
                    color: Color.fromARGB(251, 134, 58, 249)),
                typeoffile(
                    title: 'Files',
                    ontap: () {},
                    icon: const Icon(
                      Icons.attach_file_outlined,
                      size: 35,
                      color: Colors.white,
                    ),
                    color: Color.fromARGB(255, 251, 28, 99)),
                typeoffile(
                    title: 'Gallery',
                    ontap: () async {
                      sendimageorvideo_ontap(context, id);
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 35,
                      color: Colors.white,
                    ),
                    color: Color.fromARGB(255, 45, 153, 248)),
              ],
            ),
          ),
        );
      }),
    );
  });
}

void sendimageorvideo_ontap(context, id) async {
  List<MediaFile>? media = await gallerypick(context);
  BlocProvider.of<SendFilesCubit>(context)
      .sendfile(type: sendimageorvideo(), data: media, docs: id);
  // if (media != null) {
  //   showDialog(
  //       context: context,
  //       builder: (c) {
  //         return AlertDialog(
  //           content: PhotoProvider(
  //             media: media![0],
  //             height: 200,
  //             width: 200,
  //           ),
  //         );
  //       }
  //       );
  // }
}
