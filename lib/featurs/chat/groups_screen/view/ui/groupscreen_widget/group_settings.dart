// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/class/alert_dialog.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/data/models/group_model.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/cubit/cubit_creategroup/create_groupe_cubit.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/cubit/cubit_creategroup/create_groupe_state.dart';
import 'package:sophia_chat/featurs/settings/view/settings_screen/Setting_screen_widgets/itemofsetting_with_sweach.dart';
import 'package:sophia_chat/utilits/alertdialog_gineraluse.dart';
import 'package:sophia_chat/utilits/gineral_choise_photo_from_gallery.dart';

class UserandMembers {
  List<UserModel> members;
  UserModel usermodel;

  UserandMembers(this.members, this.usermodel);
}

class GrpupSetting extends StatefulWidget {
  GrpupSetting({super.key, required this.userandmembers});

  UserandMembers userandmembers;

  @override
  State<GrpupSetting> createState() => _GrpupSettingState();
}

class _GrpupSettingState extends State<GrpupSetting> {
  File? photo;

  TextEditingController controller = TextEditingController();
  StreamController<File?>? stream;

  String? owner;

  List members = [];
  bool? sendmessage = false;
  bool? addothersmembers = false;

  @override
  void initState() {
    widget.userandmembers.members.forEach((value) {
      members.add(value.uid);
    });
    stream = StreamController();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    stream!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CreateGroupeCubit(),
        child: Builder(builder: (context) {
          return Scaffold(
              floatingActionButton: FloatingActionButton(
                  backgroundColor: ColorApp.primarycolor,
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    BlocProvider.of<CreateGroupeCubit>(context).create(
                        GroupModelcreate.tojson(
                            controller.text.toString(),
                            "",
                            "",
                            [],
                            members,
                            Settingmodel.tojson(sendmessage, addothersmembers),
                            []),
                        photo);
                  }),
              backgroundColor: ColorApp.greycolor,
              appBar: AppBar(
                backgroundColor: ColorApp.primarycolor,
                title: Text(
                  "New Group",
                  style:
                      TextStyleConst.textstyle18.copyWith(color: Colors.white),
                ),
                leading: Ink(
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ),
              body: Builder(builder: (context) {
                return BlocListener<CreateGroupeCubit, CreateGrupeState>(
                  listener: (context, state) async {
                    if (state is CreateGroupeLoading) {
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.transparent,
                              content: Container(
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ))),
                            );
                          });
                    } else if (state is CreateGroupeSucces) {
                      showawesamedialog(
                        context: context,
                        ontap1: () {
                          GoRouter.of(context).pop();
                          GoRouter.of(context).pop();
                          GoRouter.of(context).pop();
                        },
                        dialogType: DialogType.success,
                        content: "The group has been created successfully",
                      );
                    } else if (state is CreateGroupefail) {
                      showawesamedialog(
                        context: context,
                        ontap1: () {},
                        dialogType: DialogType.error,
                        content: state.error,
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                          color: Colors.white,
                          child: Builder(builder: (context) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                StreamBuilder(
                                    initialData: null,
                                    stream: stream!.stream,
                                    builder: (context, snap) {
                                      if (snap.data != null) {
                                        photo = snap.data;
                                        return Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    context: context,
                                                    builder: (c) {
                                                      return CustomGalleryViewgineral(
                                                        stream: stream!,
                                                      );
                                                    });
                                              },
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundImage:
                                                    FileImage(snap.data!),
                                              ),
                                            ));
                                      } else
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  context: context,
                                                  builder: (c) {
                                                    return CustomGalleryViewgineral(
                                                      stream: stream!,
                                                    );
                                                  });
                                              stream!.add(photo);
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: Color.fromARGB(
                                                  255, 197, 193, 193),
                                              radius: 30,
                                              child: Center(
                                                  child: Icon(
                                                Icons.camera_alt_rounded,
                                                size: 33,
                                                color: Colors.white,
                                              )),
                                            ),
                                          ),
                                        );
                                    }),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SizedBox(
                                    height: 60,
                                    child: customtextfeildsimple(
                                        controller: controller,
                                        context: context,
                                        hint: "group name"),
                                  ),
                                )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.emoji_emotions_outlined,
                                    color: Color.fromARGB(255, 126, 125, 125),
                                    size: 30,
                                  ),
                                )
                              ],
                            );
                          }),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          padding: EdgeInsets.all(13),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                            children: [
                              itemofsettingwithswitch(
                                  title: "send messages",
                                  swich: sendmessage!,
                                  ontap: (bool swich) {
                                    sendmessage = swich;
                                  },
                                  icondata: Icons.message_rounded,
                                  iconcolor:
                                      const Color.fromRGBO(129, 128, 128, 1)),
                              itemofsettingwithswitch(
                                  title: "adding other members",
                                  swich: addothersmembers!,
                                  ontap: (bool swich) {
                                    addothersmembers = swich;
                                  },
                                  icondata: Icons.person_add,
                                  iconcolor:
                                      const Color.fromARGB(255, 129, 128, 128)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "members",
                              style: TextStyleConst.textstyle17.copyWith(
                                  color: const Color.fromARGB(255, 73, 72, 72)),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child:
                                membersofgroup(widget.userandmembers.members))
                      ],
                    ),
                  ),
                );
              }));
        }));
  }
}

Widget membersofgroup(List<UserModel> members) {
  return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 1, mainAxisSpacing: 4, maxCrossAxisExtent: 90),
      itemCount: members.length,
      itemBuilder: (context, i) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(members[i].url!),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              members[i].name!,
              textWidthBasis: TextWidthBasis.parent,
              style: TextStyleConst.textstyle17,
            )
          ],
        );
      });
}

customtextfeildsimple(
    {context, hint, input, required TextEditingController controller}) {
  return TextFormField(
    autofocus: true,
    style: TextStyleConst.textstyle18.copyWith(color: Colors.black),
    controller: controller,
    decoration: InputDecoration(

        //isCollapsed: true,
        contentPadding: const EdgeInsets.all(10),
        // isDense: true,
        hintText: hint,
        hintStyle: TextStyleConst.textstyle16
            .copyWith(color: const Color.fromARGB(255, 173, 171, 171)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 173, 171, 171))),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: ColorApp.primarycolor)),
        // hintText: hint,
        alignLabelWithHint: true),
  );
}
