// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/class/alert_dialog.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/auth/gender_/data/repos/repo_imp_adduser.dart';
import 'package:sophia_chat/featurs/auth/gender_/view/cubit/cubit/add_user_data_to_firebase_cubit.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/utilits/custom_elevated_button.dart';

class GenderScreen extends StatelessWidget {
  GenderScreen({super.key});
  Gender? gender = Gender.Male;
  SharedPref p = SharedPref();
  String? name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            AddUserDataToFirebaseCubit1(RepoImpAddUserToFireBase()),
        child: Scaffold(body: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hi mostafa,\nChooce Gender",
                    textAlign: TextAlign.left,
                    style: TextStyleConst.textstyle25,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "just help us to know most the overall experrience by using our apps,",
                  style: TextStyleConst.textstyle14.copyWith(
                      color: const Color.fromARGB(255, 116, 114, 114)),
                ),
                const SizedBox(
                  height: 35,
                ),
                GenderPickerWithImage(
                  isCircular: false,
                  size: 80,
                  onChanged: (Gender? value) {
                    gender = value;
                  },
                ),
                const Spacer(),
                CustomElevatedbutton(
                    ontap: () async {
                      BlocProvider.of<AddUserDataToFirebaseCubit1>(context)
                          .adduser(
                              userModel: UserModel.tojson(
                        name: await p.getfromshared('name'),
                        email: await p.getfromshared('email'),
                        passowrd: await p.getfromshared('password'),
                        gender: gender.toString(),
                      ));
                      // ignore: use_build_context_synchronously
                      showdialog(
                          context: context,
                          title: "pleasse enter ",
                          ontap1: () {
                            GoRouter.of(context)
                                .pushReplacement(approuter.login);
                          });
                    },
                    text: "Continue SetUp")
              ],
            ),
          );
        })));
  }
}
