import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophia_chat/class/alert_dialog.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/cubit/cubitsendmessage/cubit/send_message_cubit.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/chat_model.dart';

class CustomTextFeildMessage extends StatefulWidget {
  CustomTextFeildMessage({super.key, required this.docs, this.controle});
  ScrollController? controle;
  String docs;
  @override
  State<CustomTextFeildMessage> createState() => _CustomTextFeildMessageState();
}

class _CustomTextFeildMessageState extends State<CustomTextFeildMessage> {
  TextEditingController? controller;
  bool send = false;
  @override
  void initState() {
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
    showBottomSheet(context: context, builder: (context) => bottomshet());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
  }
}

Widget bottomshet() {
  return Builder(builder: (context) {
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
                ontap: () {},
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
  });
}

Widget typeoffile(
    {required String? title,
    required Function()? ontap,
    required Icon? icon,
    required Color color}) {
  return InkWell(
    hoverColor: const Color.fromARGB(255, 105, 104, 104),
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: icon,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            title!,
            style: TextStyleConst.textstyle15
                .copyWith(fontWeight: FontWeight.w800),
          )
        ],
      ),
    ),
  );
}
