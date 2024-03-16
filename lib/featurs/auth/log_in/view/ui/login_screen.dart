// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/class/alert_dialog.dart';
import 'package:sophia_chat/class/sendverify_emaik.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/auth/log_in/data/repos/abstract_login_repo.dart';
import 'package:sophia_chat/featurs/auth/log_in/view/cubit/cubit/log_in_cubit.dart';
import 'package:sophia_chat/featurs/auth/log_in/view/ui/login_widgets/form_login.dart';
import 'package:sophia_chat/featurs/auth/log_in/view/ui/login_widgets/show_alertdialog.dart';
import 'package:sophia_chat/featurs/auth/sign_up/view/ui/sign_up_widget/showdialog.dart';
import 'package:sophia_chat/utilits/custom_elevated_button.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  GlobalKey<FormState>? formk = GlobalKey<FormState>();
  TextEditingController controller_email = TextEditingController();

  TextEditingController controller_password = TextEditingController();
  SendverifyEmail? sendverifyEmail = SendverifyEmail(FirebaseAuth.instance);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LogInCubit(LogInEmailAndPasswordRepo()),
        child: Builder(builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1498758536662-35b82cd15e29?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Ymx1ZSUyMHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D"))),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      leading: InkWell(
                          onTap: () {
                            GoRouter.of(context)
                                .pushReplacement(approuter.signup);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      trailing: Text(
                        "SignUp",
                        style: TextStyleConst.textstyle16
                            .copyWith(color: Colors.white),
                      ),
                    )),
                Expanded(
                  flex: 4,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    reverse: true,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 2.3,
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
                                    "Get LogIn",
                                    style: TextStyleConst.textstyle22
                                        .copyWith(fontWeight: FontWeight.bold),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              FormLoginScreen(
                                controller_password: controller_password,
                                controller_email: controller_email,
                                formk: formk!,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              BlocListener<LogInCubit, LogInState>(
                                listener: (context, state) {
                                  if (state is LogInloading) {
                                    showdialogofloading(context);
                                  }
                                  if (state is LogInfail) {
                                    context.pop();
                                    showdialoglogin(
                                        context, state.state, Text(state.error),
                                        () {
                                      context.pop();
                                    });
                                  }
                                  if (state is LogInsucces) {
                                    GoRouter.of(context)
                                        .pushReplacement(approuter.gender);
                                  }
                                },
                                child: CustomElevatedbutton(
                                    ontap: () {
                                      BlocProvider.of<LogInCubit>(context)
                                          .login(controller_email.text,
                                              controller_password.text);
                                    },
                                    text: "LogIn"),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                  highlightColor: Colors.grey,
                                  onTap: () {
                                    GoRouter.of(context).pushReplacement(
                                        approuter.forgetpassword);
                                  },
                                  child: Text(
                                    "Forget password?",
                                    style: TextStyleConst.textstyle14,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
