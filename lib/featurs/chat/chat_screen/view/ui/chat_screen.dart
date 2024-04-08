// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/auth/gender_/data/user_model.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/cubit/cubitsendmessage/cubit/send_message_cubit.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/cubit/getchat/cubit/get_chat_cubit.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/custom_appbar.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/customtextfeildandbutton.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/messageuser1_custom.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/messageuser2.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.usermodel});
  ScrollController? controller = ScrollController();
  ScrollController? controle = ScrollController();

  String id = "1111";
  UserModel usermodel;
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback(jump());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetChatCubit()..getchat(usermodel.uid),
        ),
        BlocProvider(
          create: (context) => SendMessageCubit(),
        ),
      ],
      child: Scaffold(
        appBar: customappbar(
            name: usermodel.name, state: "active now", url: usermodel.photo!),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              // Expanded(
              //   flex: 2,
              //   child:
              // ),
              Expanded(
                flex: 14,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    controller: controle,
                    child: BlocBuilder<GetChatCubit, GetChatState>(
                      builder: (context, state) {
                        if (state is GetChatsuccess) {
                          print("enter");
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
                                                usermodel.uid
                                            ? MessageContainerCustomuser2(
                                                url: usermodel.photo!,
                                                state: false,
                                                message: state
                                                    .chat.message![i].message!)
                                            : Column(
                                                children: [
                                                  MessageContainerCustomuser1(
                                                    message: state.chat
                                                        .message![i].message!,
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
                                controle: controle,
                              )
                            ],
                          );
                        }
                        if (state is GetChatfail) {
                          return Center(
                            child: Text(state.error),
                          );
                        }
                        return Container();
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
