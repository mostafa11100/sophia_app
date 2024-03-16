import 'package:flutter/material.dart';
import 'package:sophia_chat/function/validator_functions.dart';
import 'package:sophia_chat/utilits/custom_texfeild.dart';

class EmailForm extends StatelessWidget {
  EmailForm(
      {super.key,
      required this.formk,
      required this.controller_name,
      required this.controller_email});
  GlobalKey<FormState> formk;
  TextEditingController controller_name;

  TextEditingController controller_email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formk,
      child: Column(
        children: [
          CustomTextFormFeild(
            obsc: false,
            controller: controller_name,
            hint: "username",
            validator: validatname,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormFeild(
            obsc: false,
            controller: controller_email,
            hint: "email Eddress",
            validator: validatemail,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
