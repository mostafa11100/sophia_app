import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';

Widget searchfeildcustom({
  required String hint,
  required Function() ontap,
  required TextEditingController controller,
}) {
  return SizedBox(
    height: 45,
    child: TextField(
      onEditingComplete: ontap,
      style: TextStyleConst.textstyle17.copyWith(
        color: const Color.fromARGB(255, 245, 243, 243),
      ),

      //enabled: true,
      controller: controller,
      cursorColor: Colors.white,
      decoration: InputDecoration(

          //contentPadding: const EdgeInsets.only(bottom: 0, right: 6),
          prefixIcon: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: ontap,
            child: Padding(
              padding: const EdgeInsets.only(top: 9, left: 6),
              child: const Icon(
                Icons.search,
                size: 30,
                color: Color.fromARGB(255, 245, 243, 243),
              ),
            ),
          ),
          // hoverColor: ,

          suffix: Padding(
            padding: const EdgeInsets.only(bottom: 1, left: 3),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                controller.clear();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0, left: 3),
                child: const Icon(
                  Icons.close,
                  size: 20,
                  color: Color.fromARGB(255, 245, 243, 243),
                ),
              ),
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30)),
          filled: true,
          fillColor: ColorApp.primarycolor3,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30)),
          hintText: hint,
          hintStyle: TextStyleConst.textstyle17.copyWith(
            height: .0,
            color: const Color.fromARGB(255, 245, 243, 243),
          )),
    ),
  );
}
