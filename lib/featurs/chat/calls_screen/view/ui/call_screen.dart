// ignore_for_file: must_be_immutable

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/calls_screen/data/models/list_tile_calls_model.dart';
import 'package:sophia_chat/featurs/chat/calls_screen/view/ui/call_screen_widgets/bodyofcall_empty.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bodyofcallscreen_empty(() {}, MediaQuery.of(context).size.width);
    // ListView.builder(
    //     shrinkWrap: false,
    //     itemCount: 10,
    //     itemBuilder: (c, i) {
    //       return ListTileCalls(
    //         model: CallsModel.fromjson(json: {
    //           'calltype': "video",
    //           "number": 10,
    //           "uid1": ' QYk68SnoDBNBY2WYkjUT0DUG8bi1',
    //           'uid2': "jTfN06KUljT13n8wK75mkwPakGm1",
    //           'calleruid': 'QYk68SnoDBNBY2WYkjUT0DUG8bi1'
    //         }),
    //         usermodel:
    //             UserModel.fromjson(uid: "jTfN06KUljT13n8wK75mkwPakGm1", json: {
    //           'name': "ahmed",
    //           "email": 'mos',
    //           'gender': 'male',
    //           'photo':
    //               'https://firebasestorage.googleapis.com/v0/b/sophia-chat.appspot.com/o/empty.PNG?alt=media&token=1cea72c5-8e69-453e-958a-24a7fdea8ee7'
    //         }),
    //       );
    //     });
  }
}

class ListTileCalls extends StatelessWidget {
  ListTileCalls({super.key, required this.model, required this.usermodel});
  CallsModel model;
  UserModel usermodel;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          leading: Stack(
            children: [
              CircularProfileAvatar(
                '',
                // borderColor: listofcolors[0],
                //  borderWidth: 2.5,
                radius: 27,
                // child: Image.network(
                //   usermodel.url!,
                //   fit: BoxFit.fill,
                // ),
              ),
              Positioned(
                left: 40,
                top: 40,
                child: Visibility(
                  visible: true,
                  child: CircleAvatar(
                    backgroundColor: ColorApp.primarycolor,

                    radius: 6,
                    // borderWidth: 2,
                  ),
                ),
              ),
            ],
          ),
          title: SizedBox(
            height: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    usermodel.name!,
                  ),
                ),
                Visibility(
                  visible: true,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: ColorApp.primarycolor,
                    ),
                  ),
                )
              ],
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Icon(
                  model.calleruid == usermodel.uid
                      ? Icons.phone_callback
                      : Icons.phone_missed,
                  color: model.calleruid == usermodel.uid
                      ? ColorApp.primarycolor
                      : Colors.red,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  model.calleruid == usermodel.uid
                      ? "last called ${model.time} "
                      : "You missed avoice cal",
                  style: TextStyleConst.textstyle15.copyWith(
                      color: model.calleruid == usermodel.uid
                          ? ColorApp.seenmessagecolor
                          : Colors.red),
                ),
              ],
            ),
          ),
          trailing: SizedBox(
            width: 61,
            height: 20,
            child: Row(
              children: [
                const Icon(
                  Icons.video_call,
                  color: Color.fromARGB(255, 2, 248, 133),
                  size: 26,
                ),
                const SizedBox(
                  width: 7,
                ),
                Icon(
                  Icons.phone,
                  color: ColorApp.primarycolor,
                  size: 26,
                ),
              ],
            ),
          ),
        ));
  }
}
