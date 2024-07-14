// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophia_chat/class/modelofgroupprametar.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/customtextfeildandbutton.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/messageuser1_custom.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/messageuser2.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/cubit/cubit/get_groups_cubit.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/cubit/getchatofgroup_cubit/cubit/get_chat_of_group_cubit.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/cubit/send_messagegroup_cubit/cubit/send_message_group_cubit.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/group_chat_shimmer.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/groupscreen_widget/custom_apppar_group.dart';

class GroupChatScreen extends StatefulWidget {
  GroupChatScreen({super.key, required this.modelofgroupprametar});

  Modelofgroupprametar modelofgroupprametar;

  @override
  State<GroupChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<GroupChatScreen> {
  ScrollController? controller = ScrollController();

  ScrollController? controle = ScrollController();

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback(jump());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SendMessageGroupCubit(),
        ),
        BlocProvider(
            create: (context) => GetChatOfGroupCubit()
              ..getchat(groupid: widget.modelofgroupprametar.id))
      ],
      child: BlocBuilder<GetChatOfGroupCubit, GetChatOfGroupState>(
        builder: (context, state) {
          if (state is GetChatOfGroupSucces) {
            return Scaffold(
              appBar: CustomAppBarGroup(
                  groupmodel: GroupAndmembersmdoel(state.groupModelcreate,
                      state.members, widget.modelofgroupprametar.id)),
              body: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Expanded(
                      flex: 14,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                            controller: controle,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height - 160,
                                  child: ListView.builder(
                                    controller: controller,
                                    reverse: true,
                                    itemCount:
                                        state.groupModelcreate.message!.length,
                                    itemBuilder: (c, i) {
                                      return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 2),
                                          child: state.groupModelcreate
                                                      .message![i].uid !=
                                                  widget.modelofgroupprametar
                                                      .userModel.uid
                                              ? MessageContainerCustomuser2(
                                                  usermodel: howsendmessage(
                                                      state.members,
                                                      state.groupModelcreate
                                                          .message![i].uid),
                                                  state: false,
                                                  message: state
                                                      .groupModelcreate
                                                      .message![i]
                                                      .message!)
                                              : Column(
                                                  children: [
                                                    MessageContainerCustomuser1(
                                                        message: state
                                                            .groupModelcreate
                                                            .message![i],
                                                        type: state
                                                            .groupModelcreate
                                                            .message![i]
                                                            .type!,
                                                        url:
                                                            "https://firebasestorage.googleapis.com/v0/b/sophia-chat.appspot.com/o/images%2FIMG-20240711-WA0014.jpg?alt=media&token=1bfe006a-ba00-4275-ab01-32183d11bd5c"),
                                                    Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: seen(state
                                                            .groupModelcreate
                                                            .message![i]
                                                            .seen))
                                                  ],
                                                ));
                                    },
                                  ),
                                ),
                                Builder(builder: (context) {
                                  return CustomTextFeildMessage(
                                    docs: widget.modelofgroupprametar.id,
                                    usermodel:
                                        widget.modelofgroupprametar.userModel,
                                    collectionname: 'groups',
                                    feildnamel: 'messages',
                                  );
                                })
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return ShimmerGroupChat();
        },
      ),
    );
  }
}

Widget seen(state) {
  return state == true
      ? Text("seen",
          style: TextStyleConst.textstyle12.copyWith(color: Colors.grey))
      : Text(
          "Not seen",
          style: TextStyleConst.textstyle12.copyWith(color: Colors.grey),
        );
}

UserModel howsendmessage(List<UserModel> members, uid) {
  UserModel? user;
  for (UserModel val in members) {
    if (val.uid == uid) {
      user = val;
      break;
    }
  }
  return user!;
}
