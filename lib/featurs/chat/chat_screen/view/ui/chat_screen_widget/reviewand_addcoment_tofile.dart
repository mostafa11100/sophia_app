// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/textfeild_sendmessage_of_review_screen.dart';
import 'package:image_network/image_network.dart';

// ignore: must_be_immutable
class reviewandaddcoment extends StatefulWidget {
  reviewandaddcoment(
      {super.key, this.image, required this.type, required this.id});
  String id;
  String type;

  dynamic image;

  @override
  State<reviewandaddcoment> createState() => _reviewandaddcomentState();
}

class _reviewandaddcomentState extends State<reviewandaddcoment> {
  //List<File> files = [];
  // @override
  // void initState() {
  //   // File? file;
  //   // int i = 0;
  //   if (widget.type == "image") {
  //     // Future.forEach(widget.image! as List<File>,
  //     //  (element) async
  //     // {
  //     //  // file = await element.getFile();

  //     //   files.add(file!);
  //     //   if (i == widget.image.length - 1)
  //     //   {
  //     //     setState(() {});
  //     //   }
  //     //   i++;
  //     // });
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorApp.primarycolor6,
        // appBar: AppBar(
        //   backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        //   leading:
        // ),
        body: Container(
            padding: EdgeInsets.only(top: 50),
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 253, 251, 251),
                    size: 30,
                  ),
                ),
                SizedBox(
                  child: SingleChildScrollView(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height - 250,
                        width: MediaQuery.of(context).size.width,
                        child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.type != "gif"
                                ? widget.type == 'file'
                                    ? widget.image.length
                                    : widget.image.length
                                : 1,
                            itemBuilder: (c, i) {
                              return SizedBox(
                                  // width: MediaQuery.of(context).size.width,
                                  // height: MediaQuery.of(context).size.height,
                                  child: widget.type != "gif"
                                      ? Image(
                                          // fit: BoxFit.contain,

                                          image: FileImage(
                                              widget.type == "image"
                                                  ? widget.image[i]
                                                  : widget.image[i]),
                                          // fit: BoxFit.fill
                                        )
                                      : ImageNetwork(
                                          image: widget.image!,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          duration: 1500,
                                          curve: Curves.easeIn,
                                          onPointer: true,
                                          debugPrint: false,
                                          fullScreen: false,
                                          fitAndroidIos: BoxFit.cover,
                                          fitWeb: BoxFitWeb.cover,
                                          borderRadius:
                                              BorderRadius.circular(70),
                                          onLoading:
                                              const CircularProgressIndicator(
                                            color: Colors.indigoAccent,
                                          ),
                                          onError: const Icon(
                                            Icons.error,
                                            color: Colors.red,
                                          ),
                                          onTap: () {
                                            debugPrint(
                                                "©gabriel_patrick_souza");
                                          },
                                        ));
                            })),
                  ),
                ),
                const Spacer(),
                TextfeildSendmessageOfReviewScreen(
                  docs: widget.id,
                  type: widget.type,
                  media: widget.image,
                )
              ],
            )));
  }
}
