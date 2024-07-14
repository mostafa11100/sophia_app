// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/profile/view/cubit/get_user_data/cubit/get_user_data_cubit.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_shimmer.dart';

import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/bioandfollowers.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/custom_appBar.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/custom_gridview.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_widgets/friends_list.dart';
import 'package:sophia_chat/utilits/error_elrtdialog.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    super.key,
  });
  UserModel? usermodel;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ScrollController? controller;
  @override
  void initState() {
    controller = ScrollController();

    super.initState();
  }

  void dispose() {
    controller!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserDataCubit()..getdata(),
      child: Scaffold(
          backgroundColor: ColorApp.greycolor,
          body: Stack(
            children: [
              CustomAppBar(
                controller: controller,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  controller: controller,
                  reverse: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 90,
                        ),
                        BlocConsumer<GetUserDataCubit, GetUserDataState>(
                          builder: (context, state) {
                            if (state is GetUserDatasucces) {
                              return Column(
                                children: [
                                  BioAndFollowrs(
                                    usermodel: state.model.usermodel,
                                  ),
                                  friendslist(
                                      state.model.listofriends, Colors.white),
                                  customgridview(
                                      usermodel: state.model.usermodel)
                                ],
                              );
                            }
                            return ProfleShimmer();
                          },
                          listener:
                              (BuildContext context, GetUserDataState state) {
                            if (state is GetUserDatafail) {
                              alertdialogerror(context, state.error, () {
                                BlocProvider.of<GetUserDataCubit>(context)
                                    .getdata();
                                GoRouter.of(context).pop();
                              });
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
