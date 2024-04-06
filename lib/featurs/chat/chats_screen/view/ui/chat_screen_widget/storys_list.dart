import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/story_icon_model.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/cubit/usercubit/user_data_cubit.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/ui/chat_screen_widget/circle_ofstroy.dart';

class StorysList extends StatelessWidget {
  const StorysList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: CustomCircleAvatarOfStory(
                    ontap: () {},
                    models: StoryModel.fromjson(
                        {'name': "your story", 'url': "", 'state': false}),
                    visible: false,
                    child: const Opacity(
                        opacity: 0.7,
                        child: Icon(
                          Icons.add,
                          size: 34,
                        ))),
              ),
              BlocBuilder<UserDataCubit, UserDataState>(
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
                                state.listofusermodel[i].listofs[0];
                                print("push");
                                GoRouter.of(context).push(approuter.storyview,
                                    extra: state.listofusermodel[i].listofs);
                              },
                              visible: true,
                              child: Image.network(
                                state.listofusermodel[i].url!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        });
                  }
                  if (state is UserDatafail) {
                    return Center(
                      child: Text(state.error),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
