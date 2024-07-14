// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/auth/sign_up/data/repo/CreateAcount_EmailAnd_Password.dart';
import 'package:sophia_chat/featurs/auth/sign_up/view/cubit/cubit/creat_acount_cubit_cubit.dart';
import 'package:sophia_chat/featurs/auth/sign_up/view/ui/sign_up_widget/apppar.dart';
import 'package:sophia_chat/featurs/auth/sign_up/view/ui/sign_up_widget/checkbox_and_button.dart';
import 'package:sophia_chat/featurs/auth/sign_up/view/ui/sign_up_widget/email_form.dart';
import 'package:sophia_chat/featurs/auth/sign_up/view/ui/sign_up_widget/passowrd_form.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController? controller_name = TextEditingController();

  TextEditingController? controller_email = TextEditingController();

  TextEditingController? controller_passowrd = TextEditingController();

  TextEditingController? controller_confirmpass = TextEditingController();

  GlobalKey<FormState>? formk = GlobalKey<FormState>();

  GlobalKey<FormState>? formk2 = GlobalKey<FormState>();

  bool? state = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CreatAcountCubit(CreateAcountEmailAndPassword()),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              // width: MediaQuery.of(context).size.width,

              child: Image(
                image: AssetImage("assets/signinandup_backgroung.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                const Expanded(
                  flex: 1,
                  child: AppBarCustom(),
                ),
                Expanded(
                  flex: 7,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    reverse: true,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 1.8,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 33, left: 33, top: 10, bottom: 5),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Signup",
                                      style: TextStyleConst.textstyle28
                                          .copyWith(
                                              fontWeight: FontWeight.w900),
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                                EmailForm(
                                    formk: formk!,
                                    controller_name: controller_name!,
                                    controller_email: controller_email!),
                                PasswordForm(
                                  controller_passowrd: controller_passowrd,
                                  controller_confirmpass:
                                      controller_confirmpass,
                                  formk2: formk2!,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CheckBoxAndButton(
                                  formk: formk!,
                                  controller_name: controller_name!,
                                  controller_email: controller_email!,
                                  controller_passowrd: controller_passowrd!,
                                  controller_confirm_password:
                                      controller_confirmpass!,
                                  formk2: formk2!,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
