import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/story_icon_model.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/cubit/cubitaddstory/cubit_add_story.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/cubit/usercubit/user_data_cubit.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/ui/chat_screen_widget/circle_ofstroy.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/ui/chat_screen_widget/select_and_addstory_screen.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/ui/chat_screen_widget/storyview.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/ui/storys_shimmer.dart';
import 'package:sophia_chat/utilits/error_elrtdialog.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class StorysList extends StatefulWidget {
  StorysList({super.key, required this.streamrefresh});
  StreamController<SwipeRefreshState> streamrefresh;
  @override
  State<StorysList> createState() => _StorysListState();
}

class _StorysListState extends State<StorysList> {
  _endrefresh() async {
    // When all needed is done change state.

    widget.streamrefresh.sink.add(SwipeRefreshState.hidden);
  }

  StreamController<File?>? streamphoto;
  @override
  void initState() {
    streamphoto = StreamController.broadcast();
    streamphoto!.add(null);
    super.initState();
  }

  @override
  void dispose() {
    streamphoto!.close();

    widget.streamrefresh.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDatasuccess) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocProvider(
                  create: (context) => CubitAddStory(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: StreamBuilder<File?>(
                        stream: streamphoto!.stream,
                        initialData: null,
                        builder: (context, snapshot) {
                          if (snapshot.data != null) {
                            BlocProvider.of<CubitAddStory>(context)
                                .add(snapshot.data!);
                          }
                          return CustomCircleAvatarOfStory(
                              ontap: () async {
                                if (snapshot.data == null) {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return SelectAndAddstoryScreen(
                                        streamphoto: streamphoto);
                                  }));
                                }
                                // if (snapshot.data != null) {
                                //   final File editedFile =
                                //       await Navigator.of(context).push(
                                //     MaterialPageRoute(
                                //       builder: (context) => StoryMaker(
                                //         filePath: snapshot.data!.path,
                                //       ),
                                //     ),
                                //   );
                              },
                              models: StoryModel.fromjson({
                                'name': "your story",
                                'url': "",
                                'state': false
                              }),
                              visible: false,
                              child: const Opacity(
                                  opacity: 0.7,
                                  child: Icon(
                                    Icons.add,
                                    size: 34,
                                  )));
                        }),
                  ),
                ),
                BlocConsumer<UserDataCubit, UserDataState>(
                  builder: (context, state) {
                    if (state is UserDatasuccess) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.listofusermodel.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (c, i) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10, left: 10),
                              child: CustomCircleAvatarOfStory(
                                  models: StoryModel.fromjson({
                                    'name': state.listofusermodel[i].name,
                                    'url': state.listofusermodel[i].url,
                                    'state': state.listofusermodel[i].online
                                  }),
                                  ontap: () {
                                    GoRouter.of(context).push(
                                        approuter.storyview,
                                        extra: ListOfStoryModel(
                                            listOfStorys: state.listofusermodel,
                                            index: i));
                                  },
                                  visible: true,
                                  child: null),
                            );
                          });
                    }

                    if (state is UserDatafail) {
                      return Center(
                        child: Text(state.error),
                      );
                    }
                    if (state is UserDatalodaing) {
                      return StorysSimmer();
                    }
                    return const SizedBox();
                  },
                  listener: (BuildContext context, UserDataState state) {
                    if (state is UserDatasuccess) {
                      _endrefresh();
                    }
                  },
                ),
              ],
            ),
          );
        }

        return StorysSimmer();
      },
      listener: (BuildContext context, UserDataState state) {
        if (state is UserDatafail) {
          alertdialogerror(context, state.error, () {});
        }
      },
    );
  }
}
