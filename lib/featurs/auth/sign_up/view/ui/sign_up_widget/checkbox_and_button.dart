// ignore_for_file: non_constant_identifier_names, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/class/alert_dialog.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/auth/sign_up/view/cubit/cubit/creat_acount_cubit_cubit.dart';
import 'package:sophia_chat/featurs/auth/sign_up/view/ui/sign_up_widget/showdialog.dart';
import 'package:sophia_chat/function/ontap_signup_function.dart';
import 'package:sophia_chat/utilits/custom_elevated_button.dart';

// ignore: must_be_immutable
class CheckBoxAndButton extends StatefulWidget {
  CheckBoxAndButton(
      {super.key,
      required this.formk,
      required this.formk2,
      required this.controller_name,
      required this.controller_email,
      required this.controller_passowrd,
      required this.controller_confirm_password});
  TextEditingController controller_name;

  TextEditingController controller_email;

  TextEditingController controller_passowrd;

  TextEditingController controller_confirm_password;
  SharedPref pref = SharedPref();
  GlobalKey<FormState> formk;
  GlobalKey<FormState> formk2;
  @override
  State<CheckBoxAndButton> createState() => _CheckBoxAndButtonStateState();
}

class _CheckBoxAndButtonStateState extends State<CheckBoxAndButton> {
  bool? state = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: ColorApp.primarycolor,
          value: state,
          onChanged: (i) {
            setState(() {
              state = i;
            });
          },
          title: Row(
            children: [
              Text(
                "iread and agree with ",
                style: TextStyleConst.textstyle10
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "privacy & terms",
                style: TextStyleConst.textstyle10.copyWith(
                    fontWeight: FontWeight.bold, color: ColorApp.primarycolor),
              ),
            ],
          ),
        ),
        BlocListener<CreatAcountCubit, CreatAcountCubitState>(
          listener: (context, state) {
            if (state is CreatAcountCubitloading) showdialogofloading(context);
            if (state is CreatAcountCubitsuccess) {
              context.pop();
              signupontap(
                  widget.formk,
                  widget.formk2,
                  context,
                  widget.pref,
                  widget.controller_email,
                  widget.controller_passowrd,
                  widget.controller_name);
            }
            if (state is CreatAcountCubitfail) {
              context.pop();
              showd(context, state.error);
            }
          },
          child: CustomElevatedbutton(
            text: "Signup Now",
            ontap: state == true
                ? () {
                    FocusScope.of(context).unfocus();
                    if (widget.formk.currentState!.validate() &&
                        widget.formk2.currentState!.validate()) {
                      BlocProvider.of<CreatAcountCubit>(context).creatacount(
                          email: widget.controller_email.text,
                          password: widget.controller_passowrd.text);
                    }
                  }
                : null,
          ),
        )
      ],
    );
  }
}
