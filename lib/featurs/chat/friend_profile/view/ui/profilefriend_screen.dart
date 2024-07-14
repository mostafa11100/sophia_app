// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/cubit/getchat/cubit/get_chat_cubit.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/chat/friend_profile/view/cubit/get_friends/cubit/get_friends_cubit.dart';
import 'package:sophia_chat/featurs/chat/friend_profile/view/cubit/update_follwing_cubit/cubit/updat_follwoing_cubit.dart';
import 'package:sophia_chat/featurs/chat/friend_profile/view/ui/profile_friend_widget/custom_button_follow.dart';
import 'package:sophia_chat/featurs/chat/friend_profile/view/ui/profile_friend_widget/listof_photes.dart';
import 'package:sophia_chat/featurs/profile/data/repo/repo_get_friends.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/friends_list.dart';

class ProfileFriendScreen extends StatelessWidget {
  ProfileFriendScreen({super.key, required this.usermodel});
  final UserModel usermodel;
  bool follow = false;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdatFollwoingCubit(),
        ),
        BlocProvider(
          create: (context) => GetChatCubit(),
        )
      ],
      child: Builder(builder: (context) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(usermodel.url!))),
                  height: (MediaQuery.of(context).size.height / 1.8) - 20,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            GoRouter.of(context).pop();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.more_vert,
                            size: 35, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Text(
                        usermodel.name!,
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
                    usermodel.description!,
                    style: TextStyleConst.textstyle16.copyWith(
                        fontWeight: FontWeight.w700, color: Colors.blue),
                  ),
                  trailing: SizedBox(
                    width: 145,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              GoRouter.of(context)
                                  .push(approuter.chat, extra: usermodel);
                            },
                            child: Icon(
                              Icons.chat,
                              size: 30,
                            )),
                        Spacer(),
                        followcustombuttom(usermodel),
                      ],
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Text(
                        "About ${usermodel.name}",
                        style: TextStyleConst.textstyle17
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Text(
                        "More",
                        style: TextStyleConst.textstyle17.copyWith(
                            color: Colors.blue, fontWeight: FontWeight.w600),
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
                    usermodel.bio!,
                    maxLines: 3,
                    style: TextStyleConst.textstyle17.copyWith(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 143, 142, 142)),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                BlocProvider(
                  create: (context) => GetFriendsCubit(RepoGetFriends())
                    ..getfriends(usermodel.friends!),
                  child: BlocBuilder<GetFriendsCubit, GetFriendsState>(
                    builder: (context, state) {
                      if (state is GetFriendssuccess) {
                        return friendslist(
                          state.listofusers,
                          Colors.white,
                        );
                      }
                      if (state is GetFriendsfail) {
                        return Center(
                          child: Text(state.error),
                        );
                      }
                      if (state is GetFriendsloading) {
                        return Container();
                      }
                      return Container();
                    },
                  ),
                ),
                photos(usermodel.puplicpost)
              ]),
            ));
      }),
    );
  }
}
