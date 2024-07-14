// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/class/modelofgroupprametar.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/repo_sendfile/repo_imp_sendimage_video.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/repo_sendfile/repo_sendfiles_gineral.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/cubit/cubitsendfiles/cubit/send_files_cubit.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

class TextfeildSendmessageOfReviewScreen extends StatefulWidget {
  TextfeildSendmessageOfReviewScreen(
      {super.key,
      this.media,
      required this.docs,
      required this.type,
      required this.usermodel,
      required this.collectionname,
      required this.feildname});
  UserModel usermodel;
  String type;
  String docs;
  dynamic media;
  String collectionname;
  String feildname;
  @override
  State<TextfeildSendmessageOfReviewScreen> createState() =>
      _CustomTextFeildMessageState();
}

class _CustomTextFeildMessageState
    extends State<TextfeildSendmessageOfReviewScreen> {
  TextEditingController? controller;
  bool send = false;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  senddtext(context) async {
    //     SharedPref pref=SharedPref();
    //  var uid=  pref.getfromshared('uid');
    await BlocProvider.of<SendFilesCubit>(context).sendfile(
        message: controller!.text,
        type: widget.type != "gif"
            ? widget.type == "file"
                ? SendFilesGineral()
                : sendimageorvideo()
            : null,
        data: widget.media,
        docs: widget.docs,
        colectionname: widget.collectionname,
        feildname: widget.feildname);
    // } else {
    //   BlocProvider.of<SendFilesCubit>(context).sendfile(
    //       message: controller!.text, data: widget.media, docs: widget.docs);
    // }

    controller!.clear();
    if (widget.collectionname == "groups") {
      GoRouter.of(context).pop();
      GoRouter.of(context).pop();
      GoRouter.of(context).pop();
      // GoRouter.of(context).pushReplacement(approuter.groupchat,
      //     extra: Modelofgroupprametar(widget.docs, widget.usermodel));
    } else {
      GoRouter.of(context).pop();
      GoRouter.of(context).pop();
      GoRouter.of(context).pop();
      // GoRouter.of(context).push(approuter.chat, extra: widget.usermodel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SendFilesCubit(),
        child: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        senddtext(context);
                      },
                      child: CircleAvatar(
                          radius: 30,
                          backgroundColor: ColorApp.greycolor,
                          child: Icon(
                            Icons.send,
                            size: 30,
                            color: ColorApp.primarycolor,
                          ))),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 7,
                  child: SizedBox(
                    height: 45,
                    //  width: MediaQuery.of(context).size.width ,
                    child: TextField(
                      onEditingComplete: () {
                        senddtext(context);
                        // BlocProvider.of<SendFilesCubit>(context).sendfile(
                        //     message: controller!.text,
                        //     type: sendimageorvideo(),
                        //     data: widget.media,
                        //     docs: widget.docs);

                        // controller!.clear();
                        // GoRouter.of(context).pop();

                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      controller: controller,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8.0),
                          hintText: "Type your message",
                          hintStyle: TextStyleConst.textstyle17.copyWith(
                              color: const Color.fromARGB(255, 105, 104, 104)),
                          filled: true,
                          isDense: true,
                          focusColor: ColorApp.greycolor,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: ColorApp.greycolor)),
                          fillColor: ColorApp.greycolor,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: ColorApp.greycolor)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: ColorApp.greycolor)),
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.face,
                              size: 35,
                              color: ColorApp.primarycolor,
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
