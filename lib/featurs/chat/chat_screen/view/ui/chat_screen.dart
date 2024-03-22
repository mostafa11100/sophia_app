// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/auth/gender_/data/user_model.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/cubit/getchat/cubit/get_chat_cubit.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/custom_appbar.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/messageuser1_custom.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/messageuser2.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.usermodel});

  UserModel usermodel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetChatCubit()..getchat(usermodel.uid),
      child: Scaffold(
          body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              customappbar(
                  name: usermodel.name,
                  state: "active now",
                  url: usermodel.photo!),
              Expanded(
                child: SizedBox(
                  child: BlocBuilder<GetChatCubit, GetChatState>(
                    builder: (context, state) {
                      if (state is GetChatsuccess) {
                        return ListView.builder(
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
                                          message:
                                              state.chat.message![i].message!)
                                      : Column(
                                          children: [
                                            MessageContainerCustomuser1(
                                              message: state
                                                  .chat.message![i].message!,
                                            ),
                                            Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: seen(state
                                                    .chat.message![i].seen))
                                          ],
                                        ));
                            });
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
              const CustomTextFeildMessage()
            ],
          ),
        ),
      )),
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

class CustomTextFeildMessage extends StatelessWidget {
  const CustomTextFeildMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {},
                child: CircleAvatar(
                    radius: 30,
                    backgroundColor: ColorApp.greycolor,
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: ColorApp.primarycolor,
                    )),
              )),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 7,
            child: SizedBox(
              height: 45,
              //  width: MediaQuery.of(context).size.width ,
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8.0),
                    hintText: "Type your message",
                    hintStyle: TextStyleConst.textstyle17.copyWith(
                        color: const Color.fromARGB(255, 105, 104, 104)),
                    filled: true,
                    isDense: true,
                    focusColor: ColorApp.greycolor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: ColorApp.greycolor)),
                    fillColor: ColorApp.greycolor,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: ColorApp.greycolor)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: ColorApp.greycolor)),
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.face,
                        size: 35,
                        color: ColorApp.primarycolor,
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
