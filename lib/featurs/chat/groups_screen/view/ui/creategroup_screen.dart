// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/chat/friend_profile/view/cubit/get_friends/cubit/get_friends_cubit.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/groupscreen_widget/group_settings.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/groupscreen_widget/listtile_item_member_.dart';
import 'package:sophia_chat/featurs/profile/data/repo/repo_get_friends.dart';

class CreategroupScreen extends StatelessWidget {
  UserModel userdata;
  CreategroupScreen({super.key, required this.userdata});
  StreamController<bool> streamController = StreamController<bool>.broadcast();
  Map<int, UserModel> members = {};
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetFriendsCubit(RepoGetFriends())..getfriends(userdata.friends!),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: StreamBuilder<bool>(
            stream: streamController.stream,
            builder: (context, snapshot) {
              bool empty = members.isEmpty;
              return AnimatedOpacity(
                opacity: empty ? 0 : 1,
                duration: const Duration(milliseconds: 100),
                child: FloatingActionButton(
                  onPressed: empty
                      ? null
                      : () {
                          GoRouter.of(context).push(approuter.groupsetting,
                              extra: UserandMembers(
                                  members.values.toList(), userdata));
                        },
                  backgroundColor: ColorApp.primarycolor,
                  child: const Icon(
                    Icons.navigate_next_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              );
            }),
        appBar: AppBar(
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "New Group",
                  style:
                      TextStyleConst.textstyle17.copyWith(color: Colors.white),
                ),
              ),
              StreamBuilder<bool>(
                  stream: streamController.stream,
                  builder: (context, snapshot) {
                    return Text(
                      "selected ${members.length}",
                      style: TextStyleConst.textstyle14.copyWith(
                          color: const Color.fromARGB(255, 224, 222, 222)),
                    );
                  }),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.search_rounded,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
          backgroundColor: ColorApp.primarycolor,
        ),
        body: BlocBuilder<GetFriendsCubit, GetFriendsState>(
          builder: (context, state) {
            if (state is GetFriendsloading) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorApp.primarycolor,
                ),
              );
            }
            if (state is GetFriendsfail) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is GetFriendssuccess) {
              return Column(
                children: [
                  StreamBuilder<bool>(
                      stream: streamController.stream,
                      initialData: false,
                      builder: (context, snapshot) {
                        Iterable e = members.values;
                        List<dynamic> listofmodels = e.toList();
                        return AnimatedContainer(
                          height: members.isEmpty ? 0 : 60,
                          width: MediaQuery.of(context).size.width,
                          duration: const Duration(milliseconds: 300),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: members.length,
                            itemBuilder: (c, i) {
                              return Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        listofmodels[(members.length - i) - 1]
                                            .url!),
                                  ));
                            },
                          ),
                        );
                      }),
                  Expanded(
                    child: ListView.builder(
                        itemCount: state.listofusers.length,
                        itemBuilder: (c, i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                StatefulBuilder(builder: (context, setstate) {
                              return InkWell(
                                  onTap: () async {
                                    setstate(() {
                                      if (members.containsKey(i)) {
                                        members.remove(i);
                                      } else {
                                        members[i] = state.listofusers[i];
                                      }

                                      streamController.add(true);
                                    });
                                  },
                                  child: ListTileItemMember(
                                      state.listofusers[i],
                                      members.containsKey(i)));
                            }),
                          );
                        }),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
