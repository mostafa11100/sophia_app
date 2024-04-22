import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';

Widget searchfeildcustom({
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
          isCollapsed: true,
          // contentPadding: const EdgeInsets.only(top: 10, right: 6),
          prefixIcon: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: ontap,
            child: const Icon(
              Icons.search,
              size: 33,
              color: Color.fromARGB(255, 245, 243, 243),
            ),
          ),
          // hoverColor: ,

          suffix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 9),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                controller.clear();
              },
              child: const Icon(
                Icons.close,
                color: Color.fromARGB(255, 245, 243, 243),
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
          hintText: "Search friend",
          hintStyle: TextStyleConst.textstyle17.copyWith(
            height: .6,
            color: const Color.fromARGB(255, 245, 243, 243),
          )),
    ),
  );
}
