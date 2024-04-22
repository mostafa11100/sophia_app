import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/chat/friend_profile/view/cubit/update_follwing_cubit/cubit/updat_follwoing_cubit.dart';
import 'package:sophia_chat/featurs/chat/friend_profile/view/ui/profile_friend_widget/custom_button_follow.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/follow_widget.dart';

// ignore: must_be_immutable
class DraggableScrollViewCustom extends StatefulWidget {
  DraggableScrollViewCustom({super.key, required this.usermodel});
  UserModel usermodel;
  @override
  State<DraggableScrollViewCustom> createState() =>
      _DraggableScrollViewCustomState();
}

class _DraggableScrollViewCustomState extends State<DraggableScrollViewCustom> {
  DraggableScrollableController? control;
  double position = .5;
  @override
  void initState() {
    control = DraggableScrollableController();
    control!.addListener(() {
      if (control!.pixels > MediaQuery.of(context).size.height / 2) {
        GoRouter.of(context).pop();
        GoRouter.of(context).push(approuter.profilefriend);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(offset: Offset(0, 0), blurRadius: 15, spreadRadius: 0),
      ]),
      child: DraggableScrollableSheet(
          controller: control,
          expand: false,
          initialChildSize: position,
          maxChildSize: 1.0,
          minChildSize: .25,
          builder: (c, cc) {
            return Container(
              color: Colors.white,
              child: SingleChildScrollView(
                  controller: cc,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Divider(
                        indent: MediaQuery.of(context).size.width / 2 - 18,
                        endIndent: (MediaQuery.of(context).size.width / 2) - 18,
                        thickness: 2.7,
                        color: const Color.fromARGB(255, 182, 181, 181),
                      ),
                      ListTile(
                        horizontalTitleGap: 4,
                        leading: CircleAvatar(
                          radius: 34,
                          backgroundColor: Colors.red,
                          backgroundImage: NetworkImage(widget.usermodel.url!),
                        ),
                        title: Row(
                          children: [
                            Text(
                              widget.usermodel.name!,
                              style: TextStyleConst.textstyle18
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: ColorApp.primarycolor,
                                radius: 5,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          widget.usermodel.description!,
                          style: TextStyleConst.textstyle16.copyWith(
                              fontWeight: FontWeight.w700, color: Colors.blue),
                        ),
                        trailing: BlocProvider(
                          create: (context) => UpdatFollwoingCubit(),
                          child: followcustombuttom(widget.usermodel),
                        ),
                        contentPadding: const EdgeInsets.all(10),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 23),
                        // color: const Color.fromARGB(255, 245, 244, 244),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Follow(widget.usermodel.puplicpost!.length,
                                  "puplic post"),
                              Follow(widget.usermodel.followers!.length,
                                  "Followers"),
                              Follow(widget.usermodel.following!.length,
                                  "Following"),
                            ]),
                      ),
                      contactinfo(),
                      phonecall()
                    ],
                  )),
            );
          }),
    );
  }
}

Widget contactinfo() {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    title: Text(
      "Contact info",
      style: TextStyleConst.textstyle17.copyWith(fontWeight: FontWeight.w900),
    ),
    subtitle: Text(
      "miana22@gmai.com",
      style: TextStyleConst.textstyle16
          .copyWith(fontWeight: FontWeight.w400, color: Colors.grey),
    ),
    trailing: const CircleAvatar(
      backgroundColor: Colors.blue,
      radius: 27,
      child: Icon(
        Icons.email,
        color: Colors.white,
      ),
    ),
  );
}

Widget phonecall() {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    title: Text(
      "Phone Call",
      style: TextStyleConst.textstyle17.copyWith(fontWeight: FontWeight.w900),
    ),
    subtitle: Text(
      "01200782843",
      style: TextStyleConst.textstyle16
          .copyWith(fontWeight: FontWeight.w400, color: Colors.grey),
    ),
    trailing: CircleAvatar(
      backgroundColor: ColorApp.primarycolor,
      radius: 27,
      child: const Icon(
        Icons.call,
        color: Colors.white,
      ),
    ),
  );
}
