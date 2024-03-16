// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sophia_chat/function/validator_functions.dart';
import 'package:sophia_chat/utilits/custom_texfeild.dart';

class PasswordForm extends StatelessWidget {
  PasswordForm(
      {super.key,
      this.controller_confirmpass,
      this.controller_passowrd,
      required this.formk2});

  GlobalKey<FormState> formk2;
  TextEditingController? controller_confirmpass;
  TextEditingController? controller_passowrd;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formk2,
        child: Column(
          children: [
            CustomTextFormFeild(
              obsc: true,
              controller: controller_passowrd!,
              hint: "password",
              validator: validatpass,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormFeild(
              autovalidateMode: AutovalidateMode.disabled,
              obsc: true,
              controller: controller_confirmpass!,
              hint: "confirm passowrd",
              validator: (text) {
                if (text != controller_passowrd!.text) {
                  return "Password does not match the confirmed password. Please make sure both passwords match";
                }
                return null;
              },
            ),
          ],
        ));
  }
}
