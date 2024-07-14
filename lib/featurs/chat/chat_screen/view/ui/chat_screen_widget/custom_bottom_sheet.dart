// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_get/giphy_get.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/giphy_apikey.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/repo_sendfile/repo_sendfiles_gineral.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/cubit/cubitsendfiles/cubit/send_files_cubit.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/record_voice_icon.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/reviewand_addcoment_tofile.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/type_of_file_icon.dart';

import 'package:file_picker/file_picker.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/utilits/gallery_custom.dart';

Widget bottomshet(id, UserModel usermodel, collectionname, feildname) {
  return Builder(builder: (context) {
    return BlocProvider(
      create: (context) => SendFilesCubit(),
      child: Builder(builder: (context) {
        return Container(
          constraints: const BoxConstraints(maxHeight: 115),
          // padding: const EdgeInsets.symmetric(vertical: 15),
          color: ColorApp.greycolor,
          child: Center(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              scrollDirection: Axis.horizontal,
              children: [
                recordicon(
                    title: 'Audio',
                    ontap: (file, time) {
                      BlocProvider.of<SendFilesCubit>(context).sendfile(
                          message: "",
                          type: SendFilesGineral(),
                          data: [FileAndType(file, FileType(file))],
                          docs: id,
                          colectionname: collectionname,
                          feildname: feildname);
                    },
                    color: ColorApp.primarycolor),
                typeoffile(
                    title: 'Plan',
                    ontap: () {},
                    icon: const Icon(
                      Icons.redeem,
                      size: 30,
                      color: Colors.white,
                    ),
                    color: Colors.orange),
                typeoffile(
                    title: 'Gif',
                    ontap: () async {
                      GiphyClient giphyClient =
                          GiphyClient(apiKey: giphyapikey, randomId: '112');
                      String randomId = await giphyClient.getRandomId();
                      GiphyGif? gif = await GiphyGet.getGif(
                        context: context, //Required
                        apiKey: giphyapikey, //Required.
                        lang: GiphyLanguage
                            .english, //Optional - Language for query.
                        randomID:
                            randomId, // Optional - An ID/proxy for a specific user.
                        tabColor:
                            Colors.teal, // Optional- default accent color.
                        debounceTimeInMilliseconds:
                            350, // Optional- time to pause between search keystrokes
                      );
                      if (gif != null) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (c) {
                          return reviewandaddcoment(
                            usermodel: usermodel,
                            type: 'gif',
                            id: id,
                            image: gif.images!.downsized!.url,
                            collectionname: collectionname,
                            feildname: feildname,
                          );
                        }));
                      }

                      //   //
                    },
                    icon: const Icon(
                      Icons.gif,
                      size: 47,
                      color: Colors.white,
                    ),
                    color: const Color.fromARGB(255, 255, 115, 0)),
                typeoffile(
                    title: 'Location',
                    ontap: () {},
                    icon: const Icon(
                      Icons.location_on,
                      size: 30,
                      color: Colors.white,
                    ),
                    color: const Color.fromARGB(251, 134, 58, 249)),
                typeoffile(
                    title: 'Files',
                    ontap: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(allowMultiple: true);
                      File filee;
                      if (result != null) {
                        List<File> files = result.paths.map((path) {
                          filee = File(path!);

                          return filee;
                        }).toList();

                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (c) {
                          return reviewandaddcoment(
                            usermodel: usermodel,
                            image: files,
                            type: "file",
                            id: id,
                            collectionname: collectionname,
                            feildname: feildname,
                          );
                        }));
                        // BlocProvider.of<SendFilesCubit>(context).sendfile(
                        //     message: "haha",
                        //     type: SendFilesGineral(),
                        //     data: files,
                        //     docs: id);
                      }
                    },
                    icon: const Icon(
                      Icons.attach_file_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                    color: const Color.fromARGB(255, 251, 28, 99)),
                typeoffile(
                    title: 'Gallery',
                    ontap: () async {
                      sendimageorvideo_ontap(
                          context, id, usermodel, collectionname, feildname);
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                    color: const Color.fromARGB(255, 45, 153, 248)),
              ],
            ),
          ),
        );
      }),
    );
  });
}

void sendimageorvideo_ontap(
    context, id, usermodel, collectionname, feildname) async {
  showBottomSheet(
      builder: (context) {
        return CustomGalleryView(
          id: id,
          usermodel: usermodel,
          collectionname: collectionname,
          feildname: feildname,
        );
      },
      context: context);
}

String FileType(File file) {
  if (file.path.contains("jpg")) {
    return "images";
  }
  if (file.path.contains("m4a")) {
    return "audio";
  }
  if (file.path.contains("mp4")) {
    return "video";
  }
  if (file.path.contains("pdf")) {
    return "pdf";
  } else {
    int index = file.path.indexOf('.');
    return file.path.substring(index);
  }
}
