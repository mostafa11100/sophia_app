import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/story_icon_model.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/repos/repo_imp_getfrom_firstore.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/cubit/cubit/chats_cubit.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/cubit/usercubit/user_data_cubit.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/ui/chat_screen_widget/contact_listtile.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/ui/chat_screen_widget/storys_list.dart';

class BodyOfChatScreen extends StatelessWidget {
  const BodyOfChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // dd.getdocsdata("user", "QYk68SnoDBNBY2WYkjUT0DUG8bi1");

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ChatsCubit(getFromFireStore: GetFromFireStore())..getdata(),
        ),
        BlocProvider(
          create: (context) => UserDataCubit()..getdata(),
        ),
      ],
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: StorysList())),
          SliverToBoxAdapter(child: SizedBox(
            child: BlocBuilder<ChatsCubit, ChatsState>(
              builder: (context, state) {
                if (state is ChatsInitial) {
                  return Container(
                    color: Colors.red,
                  );
                }

                if (state is Chatssuccess) {
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.userAndChatModel!.length,
                      itemBuilder: (c, i) {
                        return DismissibleTile(
                            key: UniqueKey(),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            delayBeforeResize:
                                const Duration(milliseconds: 500),
                            ltrBackground:
                                const ColoredBox(color: Colors.redAccent),
                            //    rtlBackground: const ColoredBox(color: Colors.greenAccent),
                            // ltrDismissedColor: Colors.lightBlueAccent,
                            rtlDismissedColor: Colors.redAccent,
                            ltrOverlay: const Text('delete'),
                            ltrOverlayDismissed: const Text('delete'),
                            rtlOverlay: const Text('Delete'),
                            rtlOverlayDismissed: const Text('Deleted'),
                            onDismissConfirmed: () {},
                            child: // add your widget here

                                InkWell(
                              onTap: () {
                                GoRouter.of(context).push(
                                  approuter.chat,
                                  extra: state.userAndChatModel![i].userModel,
                                );
                              },
                              child: ListTileOfuser(
                                model: state.userAndChatModel![i],
                              ),
                            ));
                      });
                }

                if (state is Chatfail) {
                  return Center(
                      child: Text(
                    state.error,
                    style: const TextStyle(color: Colors.black),
                  ));
                }
                return Container();
              },
            ),
          ))
        ],
      ),
    );
  }
}
