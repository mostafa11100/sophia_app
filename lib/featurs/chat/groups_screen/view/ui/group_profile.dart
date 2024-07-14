import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/groupscreen_widget/calling_and_search_handling.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/groupscreen_widget/group_details.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/groupscreen_widget/group_setting_widget.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/groupscreen_widget/members_group_widget.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/mmodelforgroup.dart';
import 'package:sophia_chat/featurs/settings/view/settings_screen/Setting_screen_widgets/simple_item_ofsetting.dart';

// ignore: must_be_immutable
class GroupProfile extends StatelessWidget {
  GroupProfile({super.key, required this.groupmodel});

  groupandmembersmodel groupmodel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 229, 229),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: InkWell(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25,
              ),
            ),
            backgroundColor: ColorApp.primarycolor,
            expandedHeight: 50,
            pinned: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate.fixed([
            Builder(builder: (context) {
              return Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  color: Colors.white,
                  child: Center(
                      child: profilephotoofgroup(
                    context: context,
                    imagetap: () {},
                    changeprofilephoto: () {},
                    url: groupmodel.groupmodel.photo!,
                  )));
            }),
            callingandsearchandadding_item(
                groupmodel.groupmodel.name, groupmodel.members.length),
            SizedBox(
              height: 5,
            ),
            groupnameanddate(groupmodel.groupmodel.name, "22/10/2024"),
            SizedBox(
              height: 5,
            ),
            groupsetting(groupmodel.groupmodel.settingmodel!.addothermembers,
                groupmodel.groupmodel.settingmodel!.sendmessage)
          ])),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, i) {
            return membersgrup(
                UserModel.tojson(
                    name: groupmodel.members[i].name,
                    url: groupmodel.members[i].url,
                    uid: groupmodel.members[i].uid),
                jobofmember(groupmodel.groupmodel.admins!, groupmodel.members,
                    groupmodel.groupmodel.owner, i));
          }, childCount: groupmodel.members.length)),
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.all(15),
            child: simpleitemofsetting(
                ontap: () {},
                title: "Exit the group",
                icondata: Icons.block,
                iconcolor: Colors.red),
          ))
        ],
      ),
    );
  }
}

jobofmember(List admins, List<UserModel> members, owner, index) {
  return admins.contains(members[index].uid) == true
      ? "admin"
      : owner == members[index].uid
          ? "owner"
          : "";
}

profilephotoofgroup(
    {context,
    url,
    required Function() imagetap,
    required Function() changeprofilephoto}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Hero(
        tag: url,
        child: Material(
          color: Colors.transparent,
          child: CircularProfileAvatar(
            url,
            onTap: imagetap,
            radius: (MediaQuery.of(context).size.width / 5.6).toDouble(),
          ),
        ),
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
