// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/cubit/cubitsendmessage/cubit/send_message_cubit.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/cubit/getchat/cubit/get_chat_cubit.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/custom_appbar.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/customtextfeildandbutton.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/messageuser1_custom.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/messageuser2.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/shimmer_chatscreen.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/utilits/error_elrtdialog.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, required this.usermodel});
  UserModel usermodel;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController? controller = ScrollController();

  ScrollController? controle = ScrollController();

  String id = "1111";

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback(jump());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetChatCubit()..getchat(widget.usermodel),
        ),
        BlocProvider(
          create: (context) => SendMessageCubit(),
        ),
      ],
      child: Scaffold(
        appBar: customappbar(usermodel: widget.usermodel),
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
                    child: BlocConsumer<GetChatCubit, GetChatState>(
                      builder: (context, state) {
                        if (state is GetChatsuccess) {
                          id = state.id;
                          return Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height - 160,
                                child: ListView.builder(
                                  controller: controller,
                                  reverse: true,
                                  itemCount: state.chat.message!.length,
                                  itemBuilder: (c, i) {
                                    return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 2),
                                        child: state.chat.message![i].uid ==
                                                widget.usermodel.uid
                                            ? MessageContainerCustomuser2(
                                                usermodel: widget.usermodel,
                                                state: false,
                                                message: state
                                                    .chat.message![i].message!)
                                            : Column(
                                                children: [
                                                  MessageContainerCustomuser1(
                                                    url:
                                                        "https://firebasestorage.googleapis.com/v0/b/sophia-chat.appspot.com/o/images%2FIMG-20240711-WA0014.jpg?alt=media&token=1bfe006a-ba00-4275-ab01-32183d11bd5c",
                                                    message:
                                                        state.chat.message![i],
                                                    type: state
                                                        .chat.message![i].type!,
                                                  ),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: seen(state.chat
                                                          .message![i].seen))
                                                ],
                                              ));
                                  },
                                ),
                              ),
                              CustomTextFeildMessage(
                                docs: id,
                                usermodel: widget.usermodel,
                                collectionname: 'chats',
                                feildnamel: 'message',
                              )
                            ],
                          );
                        }

                        return shimmerChatscreen();
                      },
                      listener: (BuildContext context, GetChatState state) {
                        if (state is GetChatfail) {
                          alertdialogerror(context, state.error, () {
                            BlocProvider.of<GetChatCubit>(context)
                                .getchat(widget.usermodel);
                          });
                          GoRouter.of(context).pop();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
