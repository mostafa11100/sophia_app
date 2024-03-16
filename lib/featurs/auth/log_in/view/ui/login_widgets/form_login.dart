// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sophia_chat/function/validator_functions.dart';
import 'package:sophia_chat/utilits/custom_texfeild.dart';

class FormLoginScreen extends StatelessWidget {
  const FormLoginScreen(
      {super.key,
      required this.controller_email,
      required this.formk,
      required this.controller_password});
  final TextEditingController controller_email;
  final TextEditingController controller_password;
  final GlobalKey<FormState> formk;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formk,
      child: Column(
        children: [
          CustomTextFormFeild(
            obsc: false,
            controller: controller_email,
            hint: "enter email",
            validator: validatemail,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormFeild(
            obsc: true,
            controller: controller_password,
            hint: "enter password",
            validator: validatemail,
          ),
        ],
      ),
    );
  }
}
