// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/auth/sign_up/data/repo/CreateAcount_EmailAnd_Password.dart';
import 'package:sophia_chat/featurs/auth/sign_up/view/cubit/cubit/creat_acount_cubit_cubit.dart';
import 'package:sophia_chat/featurs/auth/sign_up/view/ui/sign_up_widget/apppar.dart';
import 'package:sophia_chat/featurs/auth/sign_up/view/ui/sign_up_widget/checkbox_and_button.dart';
import 'package:sophia_chat/featurs/auth/sign_up/view/ui/sign_up_widget/email_form.dart';
import 'package:sophia_chat/featurs/auth/sign_up/view/ui/sign_up_widget/form_signup_widget.dart';
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1442328166075-47fe7153c128?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFjayUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D"))),
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: AppBarCustom(),
              ),
              Expanded(
                flex: 5,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  reverse: true,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 1.6,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "SignUp",
                                  style: TextStyleConst.textstyle22
                                      .copyWith(fontWeight: FontWeight.bold),
                                )),
                            const SizedBox(
                              height: 35,
                            ),
                            EmailForm(
                                formk: formk!,
                                controller_name: controller_name!,
                                controller_email: controller_email!),
                            PasswordForm(
                              controller_passowrd: controller_passowrd,
                              controller_confirmpass: controller_confirmpass,
                              formk2: formk2!,
                            ),
                            const SizedBox(
                              height: 10,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
