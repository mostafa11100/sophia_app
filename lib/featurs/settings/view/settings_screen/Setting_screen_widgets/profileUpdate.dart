// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/settings/data/models/modelof_update_user.dart';
import 'package:sophia_chat/featurs/settings/view/cubit/cubit)getuserdata/cubit/get_profile_cubit.dart';
import 'package:sophia_chat/featurs/settings/view/cubit/cubit/update_profile_cubit.dart';
import 'package:sophia_chat/featurs/settings/view/settings_screen/Setting_screen_widgets/custom_textfeild_.dart';
import 'package:sophia_chat/utilits/alertdialog_gineraluse.dart';
import 'package:sophia_chat/utilits/error_elrtdialog.dart';
import 'package:sophia_chat/utilits/gineral_choise_photo_from_gallery.dart';

class ProfileUpdate extends StatefulWidget {
  ProfileUpdate({super.key, required this.usermodel});
  UserModel usermodel;

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  TextEditingController? controllername;
  TextEditingController? controlleremail;
  TextEditingController? controllerlocation;
  TextEditingController? controllerphone;
  TextEditingController? controllertwitter;

  StreamController<bool>? stream;
  void checkchange({File? file}) {
    if (controllerlocation!.text != widget.usermodel.location) {
      stream!.add(true);
    } else if (controllerphone!.text != widget.usermodel.phone) {
      stream!.add(true);
    } else if (controllername!.text != widget.usermodel.name) {
      stream!.add(true);
    } else if (controlleremail!.text != widget.usermodel.email) {
      stream!.add(true);
    } else if (controllertwitter!.text != widget.usermodel.description) {
      stream!.add(true);
    } else if (file != null) {
      stream!.add(true);
    } else {
      stream!.add(false);
    }
  }

  void controlersdecl() {
    controllername = TextEditingController(text: widget.usermodel.name);

    controlleremail = TextEditingController(text: widget.usermodel.email);

    controllerlocation = TextEditingController(text: widget.usermodel.location);

    controllerphone = TextEditingController(text: widget.usermodel.phone);

    controllertwitter =
        TextEditingController(text: widget.usermodel.description);
  }

  GlobalKey? alertkey;
  undofunc() {
    stream!.add(false);
    controllername = TextEditingController(text: widget.usermodel.name);

    controlleremail = TextEditingController(text: widget.usermodel.email);

    controllerlocation = TextEditingController(text: widget.usermodel.location);

    controllerphone = TextEditingController(text: widget.usermodel.phone);

    controllertwitter =
        TextEditingController(text: widget.usermodel.description);
    streamimage!.add(null);
    FocusScope.of(context).unfocus();
  }

  StreamController<File?>? streamimage;
  File? profilephoto = null;
  @override
  void initState() {
    alertkey = GlobalKey();
    streamimage = StreamController<File?>();
    stream = StreamController();

    controlersdecl();
    super.initState();
  }

  ontap1(context1) {
    BlocProvider.of<UpdateProfileCubit>(context1).update(
        url: widget.usermodel.url,
        file: profilephoto,
        modelofuserdata: ModelUpdateProfile.tojson(
            url: widget.usermodel.url,
            name: controllername!.text,
            email: controlleremail!.text,
            location: controllerlocation!.text,
            phone: controllerphone!.text,
            description: controllertwitter!.text));
    streamimage!.add(null);

    // GoRouter.of(context).pop();
  }

  // dialogupdate(context1) {
  //   showdialogalarm(
  //       ontap1: () {
  //         BlocProvider.of<UpdateProfileCubit>(context1).update(
  //             url: widget.usermodel.url,
  //             file: profilephoto,
  //             modelofuserdata: ModelUpdateProfile.tojson(
  //                 url: widget.usermodel.url,
  //                 name: controllername!.text,
  //                 email: controlleremail!.text,
  //                 location: controllerlocation!.text,
  //                 phone: controllerphone!.text,
  //                 description: controllertwitter!.text));
  //         streamimage!.add(null);

  //         GoRouter.of(context).pop();
  //       },
  //       ontap2: () {
  //         GoRouter.of(context).pop();
  //       },
  //       content: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(
  //             "about your ubdate profile",
  //             style: TextStyleConst.textstyle20
  //                 .copyWith(fontWeight: FontWeight.w700),
  //           ),
  //           SizedBox(
  //             height: 5,
  //           ),
  //           Text(
  //             "Are you sure you are updating the data?",
  //             textAlign: TextAlign.center,
  //             style: TextStyleConst.textstyle17.copyWith(
  //                 fontWeight: FontWeight.w600,
  //                 color: const Color.fromARGB(255, 124, 124, 124)),
  //           )
  //         ],
  //       ),
  //       title:
  //           Icon(Icons.priority_high, color: ColorApp.primarycolor, size: 55),
  //       context: context,
  //       text1: "confirm",
  //       text2: "cancel");
  // }

  @override
  void dispose() {
    streamimage!.close();
    stream!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UpdateProfileCubit(),
          ),
          BlocProvider(
            create: (context) => GetProfileCubit()..getprofile(),
          ),
        ],
        child: BlocConsumer<GetProfileCubit, GetProfileState>(
          builder: (context, d) {
            return BlocListener<UpdateProfileCubit, UpdateProfileState>(
              listener: (context, state) {
                if (state is UpdateProfileloading)
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: AlertDialog(
                            key: alertkey,
                            backgroundColor:
                                const Color.fromARGB(0, 255, 255, 255),
                            content: Center(
                              child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        );
                      });
                else if (state is UpdateProfilesuccess) {
                  if (alertkey!.currentContext != null) {
                    GoRouter.of(context).pop();
                  }
                } else if (state is UpdateProfilefail) {
                  if (alertkey!.currentContext != null) {
                    GoRouter.of(context).pop();
                    alertdialogerror(context, state.eror, () {
                      GoRouter.of(context).pop();
                    });
                  }
                }
              },
              child: Scaffold(
                backgroundColor: ColorApp.greycolor,
                appBar: AppBar(
                  titleSpacing: 0,
                  bottom: PreferredSize(
                    preferredSize: Size(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height / 20),
                    child: const SizedBox(),
                  ),
                  backgroundColor: ColorApp.primarycolor,
                  title: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 20),
                    child: Text(
                      "Setting",
                      style: TextStyleConst.textstyle33.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                  ),
                  actions: [
                    StreamBuilder<bool>(
                        initialData: false,
                        stream: stream!.stream,
                        builder: (context, snapshot) {
                          return AnimatedOpacity(
                            opacity: snapshot.data == false ? 0 : 1,
                            duration: const Duration(milliseconds: 200),
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    undofunc();
                                  },
                                  child: Text(
                                    "Undo",
                                    style: TextStyleConst.textstyle16.copyWith(
                                        color: const Color.fromARGB(
                                            255, 226, 224, 224),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: InkWell(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    //   dialogupdate(context);

                                    showawesamedialog(
                                      context: context,
                                      ontap1: () {
                                        ontap1(context);
                                      },
                                      ontap2: () {
                                        // GoRouter.of(context).pop();
                                      },
                                      content:
                                          "Are you sure you are updating the data?",
                                      title: "about your ubdate profile",
                                      dialogType: DialogType.warning,
                                    );
                                  },
                                  child: Text(
                                    "Done",
                                    style: TextStyleConst.textstyle16.copyWith(
                                        color: const Color.fromARGB(
                                            255, 235, 232, 232),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ]),
                          );
                        })
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.3,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              StreamBuilder(
                                  initialData: null,
                                  stream: streamimage!.stream,
                                  builder: (context, snapshat) {
                                    checkchange(file: snapshat.data);
                                    profilephoto = snapshat.data;
                                    return changephoto(
                                        context,
                                        snapshat.data == null
                                            ? CircleAvatar(
                                                radius: (MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        5.6)
                                                    .toDouble(),
                                                backgroundImage: NetworkImage(
                                                    widget.usermodel.url!))
                                            : CircleAvatar(
                                                radius: (MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        5.6)
                                                    .toDouble(),
                                                backgroundImage:
                                                    FileImage(snapshat.data!)),
                                        streamimage,
                                        widget.usermodel.url!);
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              Form(
                                  onChanged: () {
                                    checkchange();
                                  },
                                  child: Column(
                                    children: [
                                      customtextfeildofprofileupdate(
                                          context: context,
                                          hint: "Name",
                                          controller: controllername!),
                                      customtextfeildofprofileupdate(
                                          context: context,
                                          hint: "Email address  ",
                                          controller: controlleremail!),
                                      customtextfeildofprofileupdate(
                                          context: context,
                                          hint: "Location",
                                          controller: controllerlocation!),
                                      customtextfeildofprofileupdate(
                                          context: context,
                                          hint: "Phone  ",
                                          controller: controllerphone!),
                                      customtextfeildofprofileupdate(
                                          context: context,
                                          hint: "description  ",
                                          controller: controllertwitter!),
                                      // customtextfeildofprofileupdate(
                                      //     context: context,
                                      //     hint: "twitter",
                                      //     input: "disha",
                                      //     controller: controllertwitter!),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          listener: (BuildContext context, Object? state) {
            if (state is GetProfilesuccess) {
              widget.usermodel = state.usermodel;
              checkchange();
            }
          },
        ));
  }
}

profilephoto(
    {context,
    url,
    Widget? child,
    required Function() imagetap,
    required Function() changeprofilephoto}) {
  double raduis = (MediaQuery.of(context).size.width / 5.6).toDouble();
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: raduis * 2,
        width: raduis * 2,
        child: InkWell(onTap: imagetap, child: InstaImageViewer(child: child!)),
      ),
      Positioned(
        left: ((MediaQuery.of(context).size.width / 5.6) + 19),
        top: ((MediaQuery.of(context).size.width / 5.6) + 24),
        child: CircularProfileAvatar(
          "",
          borderColor: Colors.white,
          borderWidth: 1.2,
          backgroundColor: ColorApp.primarycolor,
          radius: MediaQuery.of(context).size.width / 16,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: changeprofilephoto,
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    ],
  );
}

RectTween _createRectTween(Rect? begin, Rect? end) {
  return MaterialRectCenterArcTween(begin: begin, end: end);
}

Widget heroanimate(tag, h, w, child) {
  return Hero(
      createRectTween: _createRectTween,
      tag: tag,
      child: ClipOval(
        child: Center(
          child: SizedBox(
            child: child,
            height: h,
            width: w,
          ),
        ),
      ));
}

Widget changephoto(context, Widget image, streamimage, url) {
  return profilephoto(
      child: image,
      context: context,
      imagetap: () {
        // Navigator.of(context).push(PageRouteBuilder(
        //     transitionDuration: Duration(milliseconds: 500),
        //     reverseTransitionDuration: Duration(milliseconds: 500),
        //     pageBuilder: (c, an1, an2) {
        //       double raduis =
        //           (MediaQuery.of(context).size.width / 5.6).toDouble();
        //       return AnimatedBuilder(
        //           animation: an1,
        //           builder: (c, child) {
        //             return Opacity(
        //               opacity: an1.value,
        //               child: Scaffold(
        //                 backgroundColor: Colors.black,
        //                 body: Center(
        //                   child: SizedBox(
        //                     height: raduis * 8,
        //                     width: raduis * 8,
        //                     child: heroanimate(url, raduis * 5.6, raduis * 4.3,
        //                         Material(child: image)),
        //                   ),
        //                 ),
        //               ),
        //             );
        //           });
        //     }));
      },
      changeprofilephoto: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (c) {
              return CustomGalleryViewgineral(
                stream: streamimage!,
              );
            });
      },
      url: url);
}
