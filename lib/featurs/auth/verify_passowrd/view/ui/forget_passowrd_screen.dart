import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/class/alert_dialog.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/auth/log_in/view/ui/login_widgets/show_alertdialog.dart';
import 'package:sophia_chat/featurs/auth/verify_passowrd/data/repos/abstract_resetpassowrd.dart';
import 'package:sophia_chat/featurs/auth/verify_passowrd/view/cubit/cubit/reset_password_cubit.dart';
import 'package:sophia_chat/function/validator_functions.dart';
import 'package:sophia_chat/utilits/custom_elevated_button.dart';
import 'package:sophia_chat/utilits/custom_texfeild.dart';

// ignore: must_be_immutable
class ForgetPassowrdScreen extends StatelessWidget {
  ForgetPassowrdScreen({super.key});
  GlobalKey<FormState> formk = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(ResetpassowrdFirebase()),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
            child: SingleChildScrollView(
                child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Forgot password-bro.png"))),
              ),
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Forget Passowrd",
                  style: TextStyleConst.textstyle25,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Don't wory it's happens sometimes.Enter\nyour email and we will send your passowrd to reset",
                  style: TextStyleConst.textstyle14
                      .copyWith(fontWeight: FontWeight.normal)
                      .copyWith(
                          color: const Color.fromARGB(255, 136, 134, 134)),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: formk,
                child: CustomTextFormFeild(
                    obsc: false,
                    controller: controller,
                    hint: "Email",
                    validator: validatemail),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocListener<ResetPasswordCubit, ResetPasswordState>(
                listener: (context, state) {
                  if (state is ResetPasswordloadin) {
                    showdialogofloading(context);
                  }
                  if (state is ResetPasswordsuccess) {
                    context.pop();
                    showdialoglogin(context, null, state.done, () {
                      GoRouter.of(context).pushReplacement(approuter.login);
                    });
                  }
                  if (state is ResetPasswordfail) {
                    showdialoglogin(context, true, state.error, () {
                      context.pop();
                    });
                  }
                },
                child: CustomElevatedbutton(
                    ontap: () {
                      if (formk.currentState!.validate()) {
                        BlocProvider.of<ResetPasswordCubit>(context)
                            .resetpassowrd(controller.text);
                      }
                    },
                    text: "Send"),
              ),
            ])),
          ),
        );
      }),
    );
  }
}
