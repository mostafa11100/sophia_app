import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/ui/chat_screen_widget/storys_list.dart';
import 'package:sophia_chat/featurs/chat/friend_profile/view/ui/profile_friend_widget/friendlist.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/friends_list.dart';

class ProfileFriendScreen extends StatelessWidget {
  const ProfileFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/sophia-chat.appspot.com/o/profile_photo.PNG?alt=media&token=97cb0f47-420b-4985-8d5e-cfb2b42f8752"))),
          height: (MediaQuery.of(context).size.height / 2) - 20,
          width: MediaQuery.of(context).size.width,
          child: const Align(
            alignment: Alignment.topCenter,
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 35,
                  color: Colors.white,
                ),
                Spacer(),
                Icon(Icons.more_vert, size: 35, color: Colors.white),
              ],
            ),
          ),
        ),
        ListTile(
          title: Row(
            children: [
              Text(
                "mostafa salem",
                style: TextStyleConst.textstyle21
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
            style: TextStyleConst.textstyle16
                .copyWith(fontWeight: FontWeight.w700, color: Colors.blue),
          ),
          trailing: InkWell(
            onTap: () {},
            child: Container(
              height: 45,
              width: 100,
              decoration: BoxDecoration(
                  color: ColorApp.primarycolor,
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Text(
                  "Follow",
                  style: TextStyleConst.textstyle17.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ),
            ),
          ),
          contentPadding: const EdgeInsets.all(15),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              Text(
                "About Miana",
                style: TextStyleConst.textstyle17
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              Text(
                "More",
                style: TextStyleConst.textstyle17
                    .copyWith(color: Colors.blue, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            '''hi iam miana  Incremental and agile development Web-based systems should be developed and deliveredincrementally.It is now generally recognized that it is
        impractical to specify all the requirements for such systems in
        advance''',
            maxLines: 3,
            style: TextStyleConst.textstyle17.copyWith(
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 143, 142, 142)),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        friendslistwidget(),
        SizedBox(
          height: 0,
        ),
        photos()
      ]),
    ));
  }
}

Widget photos() {
  return Builder(builder: (context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
          child: Row(
            children: [
              Text(
                "Photos",
                style: TextStyleConst.textstyle17
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              Text(
                "See all",
                style: TextStyleConst.textstyle16
                    .copyWith(color: Colors.blue, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, i) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://firebasestorage.googleapis.com/v0/b/sophia-chat.appspot.com/o/profile_photo.PNG?alt=media&token=97cb0f47-420b-4985-8d5e-cfb2b42f8752")),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  });
}
