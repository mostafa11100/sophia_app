import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/friend_profile/view/ui/profilefriend_screen.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/follow_widget.dart';

class DraggableScrollViewCustom extends StatefulWidget {
  DraggableScrollViewCustom({super.key});

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
      print(control!.pixels);
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
                        leading: const CircleAvatar(
                          radius: 34,
                          backgroundColor: Colors.red,
                          backgroundImage: NetworkImage(
                              "https://firebasestorage.googleapis.com/v0/b/sophia-chat.appspot.com/o/profile_photo.PNG?alt=media&token=97cb0f47-420b-4985-8d5e-cfb2b42f8752"),
                        ),
                        title: Row(
                          children: [
                            Text(
                              "mostafa salem",
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
                          "@milana.myles",
                          style: TextStyleConst.textstyle16.copyWith(
                              fontWeight: FontWeight.w700, color: Colors.blue),
                        ),
                        trailing: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 44,
                            width: 100,
                            decoration: BoxDecoration(
                                color: ColorApp.primarycolor,
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                              child: Text(
                                "Follow",
                                style: TextStyleConst.textstyle16.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ),
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
                              Follow(434, "puplic post"),
                              Follow(3232, "Followers"),
                              Follow(923, "Following"),
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
