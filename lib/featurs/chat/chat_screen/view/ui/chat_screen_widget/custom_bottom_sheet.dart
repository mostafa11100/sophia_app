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
import 'package:sophia_chat/utilits/gallery_custom.dart';

Widget bottomshet(id) {
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
                          message: "haha",
                          type: SendFilesGineral(),
                          data: [FileAndType(file, FileType(file))],
                          docs: id);
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
                            type: 'gif',
                            id: id,
                            image: gif.images!.downsized!.url,
                          );
                        }));
                      }
                      //   BlocProvider.of<SendFilesCubit>(context).sendfile(
                      //       message: "haha",
                      //       data: gif!.images!.downsized!.url,
                      //       docs: id);
                      //   showDialog(
                      //       context: context,
                      //       builder: (c) {
                      //         return AlertDialog(
                      //           content:
                      //               Image.network(gif!.images!.downsized!.url),
                      //         );
                      //       });
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
                        List<FileAndType> files = result.paths.map((path) {
                          filee = File(path!);

                          return FileAndType(filee, "file");
                        }).toList();

                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (c) {
                          return reviewandaddcoment(
                              image: files, type: "file", id: id);
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
                      sendimageorvideo_ontap(context, id);
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

void sendimageorvideo_ontap(context, id) async {
  // List<MediaFile>? media = await gallerypick(context);

  // Navigator.of(context).push(MaterialPageRoute(builder: (c) {
  //   return reviewandaddcoment(image: media, type: "image", id: id);
  // }));
  showBottomSheet(
      //  isDismissible: false,
      builder: (context) {
        return CustomGalleryView(id: id);
      },
      context: context);

  // BlocProvider.of<SendFilesCubit>(context).sendfile(
  //     message: "haha", type: sendimageorvideo(), data: media, docs: id);
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
  print(file.path);

  return "other";
}
