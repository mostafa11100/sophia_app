// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/cubit/cubitsendmessage/cubit/send_message_cubit.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/custom_bottom_sheet.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/chat_model.dart';

class CustomTextFeildMessage extends StatefulWidget {
  CustomTextFeildMessage({
    super.key,
    required this.docs,
    this.type = false,
    this.autofocus = false,
  });
  bool? type;
  String docs;
  bool? autofocus;
  @override
  State<CustomTextFeildMessage> createState() => _CustomTextFeildMessageState();
}

class _CustomTextFeildMessageState extends State<CustomTextFeildMessage> {
  TextEditingController? controller;
  bool send = false;
  ScrollController? _scrollController;
  bool emojystate = false;
  @override
  void initState() {
    _scrollController = ScrollController();

    controller = TextEditingController();
    controller!.addListener(() {
      setState(() {
        if (controller!.text.isEmpty) {
          send = false;
        } else {
          send = true;
        }
      });
    });
    super.initState();
  }

  senddtext() {
    _scrollController!.addListener(() {
      print(_scrollController!.offset);
    });
    //     SharedPref pref=SharedPref();
    //  var uid=  pref.getfromshared('uid');

    BlocProvider.of<SendMessageCubit>(context).send(
        widget.docs,
        MessageModel.tojson(
            time: Timestamp.fromDate(DateTime.now()),
            call: false,
            message: controller!.text,
            image: false,
            seen: false,
            uid: "jTfN06KUljT1k3n8wK75mkwPakGm1"));

    controller!.clear();
  }

  choicesendingtype() {
    showBottomSheet(
        builder: (context) => bottomshet(widget.docs), context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
                onTap: send ? senddtext : choicesendingtype,
                child: CircleAvatar(
                    radius: 30,
                    backgroundColor: ColorApp.greycolor,
                    child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                              scale: animation, child: child);
                        },
                        child: send == false
                            ? Icon(
                                Icons.add,
                                size: 30,
                                color: ColorApp.primarycolor,
                              )
                            : Icon(
                                Icons.send,
                                size: 30,
                                color: ColorApp.primarycolor,
                              )))),
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
                autofocus: widget.autofocus!,
                onEditingComplete: () {
                  senddtext();
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
                        borderSide: BorderSide(color: ColorApp.greycolor)),
                    fillColor: ColorApp.greycolor,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: ColorApp.greycolor)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: ColorApp.greycolor)),
                    suffixIcon: InkWell(
                      onTap: () async {
                        setState(() {
                          emojystate ? emojystate = false : emojystate = true;
                        });
                        if (emojystate) {
                          Scaffold.of(context).showBottomSheet((c) {
                            return emojimicker(controller, _scrollController);
                          });
                        } else {
                          context.pop();
                        }
                      },
                      child: Icon(
                        !emojystate ? Icons.face : Icons.keyboard,
                        size: 35,
                        color: !emojystate
                            ? ColorApp.primarycolor
                            : const Color.fromARGB(255, 107, 106, 106),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

emojimicker(controller, _scrollController) {
  return SingleChildScrollView(
    child: EmojiPicker(
      textEditingController: controller,
      scrollController: _scrollController,
      config: const Config(
        height: 256,
        checkPlatformCompatibility: true,
        emojiViewConfig: EmojiViewConfig(
            // Issue: https://github.com/flutter/flutter/issues/28894
            emojiSizeMax: 28
            //*
            //     (foundation.defaultTargetPlatform ==
            //             TargetPlatform.iOS
            //         ? 1.2
            //         : 1.0),
            ),
        swapCategoryAndBottomBar: false,
        skinToneConfig: SkinToneConfig(),
        categoryViewConfig: CategoryViewConfig(),
        bottomActionBarConfig: BottomActionBarConfig(),
        searchViewConfig: SearchViewConfig(),
      ),
    ),
  );
}
