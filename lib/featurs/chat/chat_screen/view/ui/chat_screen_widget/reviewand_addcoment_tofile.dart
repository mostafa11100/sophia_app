// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/textfeild_sendmessage_of_review_screen.dart';
import 'package:image_network/image_network.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

// ignore: must_be_immutable
class reviewandaddcoment extends StatefulWidget {
  reviewandaddcoment(
      {super.key,
      this.image,
      required this.type,
      required this.id,
      required this.usermodel,
      required this.collectionname,
      required this.feildname});
  String id;
  String type;
  UserModel usermodel;
  dynamic image;
  String collectionname;
  String feildname;

  @override
  State<reviewandaddcoment> createState() => _reviewandaddcomentState();
}

class _reviewandaddcomentState extends State<reviewandaddcoment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorApp.primarycolor6,
        // appBar: AppBar(
        //   backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        //   leading:
        // ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.type != "gif" ? widget.image.length : 1,
                      itemBuilder: (c, i) {
                        return typeofview(
                            type: widget.type,
                            context: context,
                            index: i,
                            image: widget.image);
                      }),
                ),
              ),
              const Positioned(
                top: 50,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 253, 251, 251),
                    size: 30,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: TextfeildSendmessageOfReviewScreen(
                    docs: widget.id,
                    type: widget.type,
                    media: widget.image,
                    usermodel: widget.usermodel,
                    collectionname: widget.collectionname,
                    feildname: widget.feildname,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

Widget typeofview({required String type, image, context, int? index}) {
  switch (type) {
    case "gif":
      return ImageNetwork(
        image: image!,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        duration: 1500,
        curve: Curves.easeIn,
        onPointer: true,
        debugPrint: false,
        fullScreen: false,
        fitAndroidIos: BoxFit.cover,
        fitWeb: BoxFitWeb.cover,
        borderRadius: BorderRadius.circular(70),
        onLoading: const CircularProgressIndicator(
          color: Colors.indigoAccent,
        ),
        onError: const Icon(
          Icons.error,
          color: Colors.red,
        ),
        onTap: () {
          debugPrint("©gabriel_patrick_souza");
        },
      );
    case "image":
      return Image(
        // fit: BoxFit.contain,

        image: FileImage(image[index]),
        // fit: BoxFit.fill
      );
    case "pdf":
      return Image(
        // fit: BoxFit.contain,

        image: FileImage(image[index].file),
        // fit: BoxFit.fill
      );
    case "file":
      return const Center(
        child: Icon(Icons.file_copy),
      );
    default:
      return const SizedBox();
  }
}
