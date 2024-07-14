import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/repos/repo_imp_getfrom_firstore.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/cubit/cubit/chats_cubit.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/cubit/usercubit/user_data_cubit.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/ui/chat_screen_widget/contact_listtile.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/ui/chat_screen_widget/storys_list.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/ui/simer_loadingchat_screen.dart';
import 'package:sophia_chat/utilits/error_elrtdialog.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class BodyOfChatScreen extends StatefulWidget {
  BodyOfChatScreen({
    super.key,
  });

  @override
  State<BodyOfChatScreen> createState() => _BodyOfChatScreenState();
}

class _BodyOfChatScreenState extends State<BodyOfChatScreen> {
  _endrefresh() async {
    // When all needed is done change state.

    str!.sink.add(SwipeRefreshState.hidden);
  }

  StreamController<SwipeRefreshState>? str;

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
    // dd.getdocsdata("user", "QYk68SnoDBNBY2WYkjUT0DUG8bi1");

    return Scaffold(
        body: MultiBlocProvider(
            providers: [
          BlocProvider(
            create: (context) =>
                ChatsCubit(getFromFireStore: GetFromFireStore())
                  ..getdata(false),
          ),
          BlocProvider(
            create: (context) => UserDataCubit()..getdata(false),
          ),
        ],
            child: Builder(builder: (context) {
              return SwipeRefresh.material(
                  stateStream: str!.stream,
                  onRefresh: () {
                    BlocProvider.of<UserDataCubit>(context).getdata(true);
                    BlocProvider.of<ChatsCubit>(context).getdata(true);
                  },
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 130,
                                  child: StorysList(
                                    streamrefresh: str!,
                                  ))),
                          SliverToBoxAdapter(
                              child: SizedBox(
                            child: BlocConsumer<ChatsCubit, ChatsState>(
                              builder: (context, state) {
                                if (state is ChatsInitial) {
                                  return Container();
                                }

                                if (state is Chatssuccess) {
                                  return ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: state.userAndChatModel!.length,
                                      itemBuilder: (c, i) {
                                        return DismissibleTile(
                                            key: UniqueKey(),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(16)),
                                            delayBeforeResize: const Duration(
                                                milliseconds: 500),
                                            ltrBackground: const ColoredBox(
                                                color: Colors.redAccent),
                                            //    rtlBackground: const ColoredBox(color: Colors.greenAccent),
                                            // ltrDismissedColor: Colors.lightBlueAccent,
                                            rtlDismissedColor: Colors.redAccent,
                                            ltrOverlay: const Text('delete'),
                                            ltrOverlayDismissed:
                                                const Text('delete'),
                                            rtlOverlay: const Text('Delete'),
                                            rtlOverlayDismissed:
                                                const Text('Deleted'),
                                            onDismissConfirmed: () {},
                                            child: // add your widget here

                                                InkWell(
                                              onTap: () {
                                                GoRouter.of(context).push(
                                                  approuter.chat,
                                                  extra: state
                                                      .userAndChatModel![i]
                                                      .userModel,
                                                );
                                              },
                                              child: ListTileOfuser(
                                                model:
                                                    state.userAndChatModel![i],
                                              ),
                                            ));
                                      });
                                }

                                return ShimmerLoadingChat();
                              },
                              listener:
                                  (BuildContext context, ChatsState state) {
                                if (state is Chatssuccess) {
                                  _endrefresh();
                                }
                                if (state is Chatfail) {
                                  _endrefresh();
                                  alertdialogerror(
                                    context,
                                    state.error,
                                    () {
                                      BlocProvider.of<ChatsCubit>(context)
                                          .getdata(false);
                                      GoRouter.of(context).pop();
                                    },
                                  );
                                }
                              },
                            ),
                          ))
                        ],
                      ),
                    ),
                  ]);
            })));
  }
}
