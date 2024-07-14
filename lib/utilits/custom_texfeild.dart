// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sophia_chat/const/text_style_const.dart';

class CustomTextFormFeild extends StatefulWidget {
  CustomTextFormFeild(
      {super.key,
      required this.controller,
      required this.hint,
      required this.validator,
      required this.obsc,
      this.autovalidateMode = AutovalidateMode.onUserInteraction});

  final TextEditingController controller;
  String? Function(String? v) validator;
  final bool obsc;
  final String hint;
  AutovalidateMode? autovalidateMode;
  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 15,
      child: TextFormField(
        autovalidateMode: widget.autovalidateMode,
        obscureText: widget.obsc,
        validator: widget.validator,
        controller: widget.controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          errorMaxLines: 3,
          errorStyle: const TextStyle(height: .7, fontSize: 13),
          focusedErrorBorder: InputBorder.none,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 250, 2, 2))),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: const Color.fromARGB(255, 247, 244, 244),
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: const Color.fromARGB(255, 247, 244, 244),
              )),
          //  hoverColor: const Color.fromARGB(255, 243, 240, 240),
          filled: true,

          hintText: widget.hint,
          hintStyle: TextStyleConst.textstyle14
              .copyWith(color: const Color.fromARGB(255, 124, 123, 123)),
          fillColor: const Color.fromARGB(255, 247, 244, 244),
        ),
      ),
    );
  }
}
