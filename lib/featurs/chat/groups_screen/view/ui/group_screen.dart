import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/class/modelofgroupprametar.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/data/models/grop_model.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/cubit/cubit/get_groups_cubit.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/cubit/userdata/cubit/get_user_data_cubit.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/groupscreen_widget/bodyofgroupscreen_empty.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/groupscreen_widget/creategroup_icon.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/groupscreen_widget/group_icond.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/groupscreen_widget/groups_shimmer.dart';
import 'package:sophia_chat/utilits/error_elrtdialog.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({
    super.key,
  });

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  StreamController<SwipeRefreshState>? str;
  _endrefresh() async {
    // When all needed is done change state.

    str!.sink.add(SwipeRefreshState.hidden);
  }

  @override
  void initState() {
    str = StreamController.broadcast();

    str!.sink.add(SwipeRefreshState.hidden);
    super.initState();
  }

  @override
  void dispose() {
    str!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetUserCubit()..getdata(),
        ),
        BlocProvider(
          create: (context) => GetGroupsCubit()..getgroups(false),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 236, 236),
        body: Builder(builder: (context) {
          return SwipeRefresh.material(
              backgroundColor: Colors.white,
              // physics: NeverScrollableScrollPhysics(),
              stateStream: str!.stream,
              onRefresh: () {
                BlocProvider.of<GetGroupsCubit>(context).getgroups(true);
              },
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height - 200,
                  child: BlocConsumer<GetUserCubit, GetUserState>(
                    builder: (context, stateuser) {
                      if (stateuser is GetUsersucces) {
                        return BlocConsumer<GetGroupsCubit, GetGroupsState>(
                          builder: (context, state) {
                            if (state is GetGroupsSucces) {
                              if (state.groups.isEmpty)
                                return bodyofgroupscreen_empty(() {
                                  GoRouter.of(context).push(
                                      approuter.listoffriends,
                                      extra: stateuser.usermodel);
                                }, MediaQuery.of(context).size.width);
                              return Container(
                                // color: Colors.white,
                                padding: const EdgeInsets.only(
                                    right: 15, left: 15, bottom: 5, top: 15),
                                child: GridView.builder(
                                    itemCount: state.groups.length == 0
                                        ? 1
                                        : state.groups.length + 1,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 7,
                                      mainAxisSpacing: 8,
                                      crossAxisCount: 2,
                                      mainAxisExtent: 200,
                                    ),
                                    itemBuilder: (c, i) {
                                      return i == 0
                                          ? CreateGroupeICon(
                                              context, stateuser.usermodel)
                                          : InkWell(
                                              onTap: () {
                                                GoRouter.of(context).push(
                                                    approuter.groupchat,
                                                    extra: Modelofgroupprametar(
                                                        state.groups[i - 1].id,
                                                        stateuser.usermodel));
                                              },
                                              child: GroupIcon(GroupModel(
                                                  image: state.groups[i - 1]
                                                      .groupModelcreate!.photo,
                                                  name: state.groups[i - 1]
                                                      .groupModelcreate!.name,
                                                  members: List.generate(
                                                      state
                                                                  .groups[i - 1]
                                                                  .mdmbers
                                                                  .length >
                                                              3
                                                          ? 3
                                                          : state
                                                              .groups[i - 1]
                                                              .mdmbers
                                                              .length, (index) {
                                                    return state.groups[i - 1]
                                                        .mdmbers[index].url
                                                        .toString();
                                                  }))),
                                            );
                                    }),
                              );
                            }

                            return GroupsShimmer();
                          },
                          listener:
                              (BuildContext context, GetGroupsState state) {
                            if (state is GetGroupsSucces) {
                              _endrefresh();
                            }
                            if (state is GetGroupsfail) {
                              _endrefresh();
                              alertdialogerror(context, state.error, () {
                                BlocProvider.of<GetGroupsCubit>(context)
                                    .getgroups(false);
                                GoRouter.of(context).pop();
                              });
                            }
                          },
                        );
                      }

                      return GroupsShimmer();
                    },
                    listener: (BuildContext context, state) {
                      if (state is GetUserfail) {
                        alertdialogerror(context, state.error, () {
                          BlocProvider.of<GetUserCubit>(context).getdata();
                          GoRouter.of(context).pop();
                        });
                      }
                    },
                  ),
                ),
              ]);
        }),
      ),
    );
  }
}
