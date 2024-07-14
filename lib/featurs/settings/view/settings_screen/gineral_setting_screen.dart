// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/featurs/settings/view/cubit/cubit)getuserdata/cubit/get_profile_cubit.dart';
import 'package:sophia_chat/featurs/settings/view/settings_screen/Setting_screen_widgets/appBarCustom_settings.dart';
import 'package:sophia_chat/featurs/settings/view/settings_screen/Setting_screen_widgets/bodyofgineral_setting.dart';
import 'package:sophia_chat/featurs/settings/view/settings_screen/Setting_screen_widgets/simple_item_ofsetting.dart';

class GineralSettingScreen extends StatefulWidget {
  const GineralSettingScreen({super.key});

  @override
  State<GineralSettingScreen> createState() => _GineralSettingScreenState();
}

class _GineralSettingScreenState extends State<GineralSettingScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController? controllername;
  TextEditingController? controlleremail;
  TextEditingController? controllerlocation;
  TextEditingController? controllerphone;
  TextEditingController? controllertwitter;
  PageController? pageController;
  List<String> ddd = [];

  Map<String, dynamic> settings_screen = {
    "update profile": {
      'route': approuter.profileedite,
      'title': "update profile",
      'icon': Icons.edit,
      'color': Colors.green
    },
    "update name": {
      'route': approuter.profileedite,
      'title': "update profile",
      'icon': Icons.edit,
      'color': Colors.green
    },
    "name": {
      'route': approuter.profileedite,
      'title': "update profile",
      'icon': Icons.edit,
      'color': Colors.green
    },
    "profile": {
      'route': approuter.profileedite,
      'title': "update profile",
      'icon': Icons.edit,
      'color': Colors.green
    }
  };
  TextEditingController? searchcontroler;
  @override
  void initState() {
    searchcontroler = TextEditingController();
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetProfileCubit()..getprofile(),
      child: Builder(builder: (context) {
        return Scaffold(
            backgroundColor: ColorApp.greycolor,
            appBar: SettingsappBar(
                controller: searchcontroler,
                screen: 0,
                context: context,
                ontap: () async {
                  FocusScope.of(context).unfocus();
                  if (pageController!.page == 0) {
                    pageController!.animateToPage(1,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.ease);
                  }
                }),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                  child: BlocBuilder<GetProfileCubit, GetProfileState>(
                builder: (context, state) {
                  if (state is GetProfileloading) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                  if (state is GetProfilesuccess) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.4,
                      width: MediaQuery.of(context).size.width,
                      child: PageView(
                        controller: pageController,
                        children: [
                          bodyofsettingitems(context, state.usermodel),
                          listofresult(
                              context,
                              settings_screen.containsKey(searchcontroler!.text)
                                  ? [settings_screen[searchcontroler!.text]]
                                  : [],
                              state.usermodel)
                        ],
                      ),
                    );
                  }
                  if (state is GetProfilefail) {
                    return Center(
                      child: Text(state.error),
                    );
                  }
                  return Container();
                },
              )),
            ));
      }),
    );
  }
}

// listofresultofsearch(context, ModelofController controllers, pageviewcontroler,
//     UserModel usermodel) {
//   return SizedBox(
//     height: MediaQuery.of(context).size.height / 1.4,
//     width: MediaQuery.of(context).size.width,
//     child: PageView(
//       controller: pageviewcontroler,
//       physics: const NeverScrollableScrollPhysics(),
//       children: [bodyofsettingitems(context, usermodel)],
//     ),
//   );
// }

class ModelofController {
  TextEditingController controller = TextEditingController();
  TextEditingController? controllername;
  TextEditingController? controlleremail;
  TextEditingController? controllerlocation;
  TextEditingController? controllerphone;
  TextEditingController? controllertwitter;
  ModelofController(this.controller, this.controllername, this.controlleremail,
      this.controllerlocation, this.controllerphone, this.controllertwitter);
}

listofresult(context, List listofre, usermodel) {
  return Card(
      child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
      width: MediaQuery.of(context).size.width,
      child: listofre.isEmpty
          ? const Center(
              child: Text("empty"),
            )
          : ListView.builder(
              itemCount: listofre.length,
              itemBuilder: (context, index) {
                return simpleitemofsetting(
                    ontap: () {
                      GoRouter.of(context)
                          .push(listofre[index]['route'], extra: usermodel);
                    },
                    title: listofre[index]['title'],
                    iconcolor: listofre[index]['color'],
                    icondata: listofre[index]['icon']);
              }),
    ),
  ));
}
