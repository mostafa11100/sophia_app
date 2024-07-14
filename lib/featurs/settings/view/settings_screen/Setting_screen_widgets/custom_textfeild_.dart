import 'package:flutter/material.dart';
import 'package:sophia_chat/const/text_style_const.dart';

customtextfeildofprofileupdate(
    {context, hint, input, required TextEditingController controller}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    //  height: 100,

    child: TextFormField(
      style: TextStyleConst.textstyle18.copyWith(color: Colors.black),
      controller: controller,
      textAlign: TextAlign.end,
      decoration: InputDecoration(
          //isCollapsed: true,
          contentPadding: const EdgeInsets.all(10),
          // isDense: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              hint,
              style: TextStyleConst.textstyle16
                  .copyWith(color: const Color.fromARGB(255, 173, 171, 171)),
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 173, 171, 171))),
          focusedBorder: const UnderlineInputBorder(
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 173, 171, 171))),
          // hintText: hint,
          alignLabelWithHint: true),
    ),
  );
}
