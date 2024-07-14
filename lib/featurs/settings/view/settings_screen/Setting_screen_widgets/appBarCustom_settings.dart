import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/search/view/ui/search_screen_widgets/custom_textfeild_search.dart';

SettingsappBar({context, required int screen, ontap, controller}) {
  return AppBar(
    //leadingWidth: 40,
    titleSpacing: 10,

    actions: [
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 700),
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text(
            "Reset",
            style: TextStyleConst.textstyle17
                .copyWith(color: const Color.fromARGB(255, 219, 218, 218)),
          ),
        ),
      ),
    ],

    backgroundColor: ColorApp.primarycolor,
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Setting",
        style: TextStyleConst.textstyle33
            .copyWith(color: Colors.white, fontWeight: FontWeight.w800),
      ),
    ),
    bottom: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height / 10),
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          color: ColorApp.primarycolor,
          child: Builder(builder: (context) {
            return SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: searchfeildcustom(
                    ontap: ontap,
                    //  () {
                    //   //Stream.value(false);
                    //   if (controllers.controller.text.isNotEmpty) {

                    //     // BlocProvider.of<SearchInFireStoreCubit>(context).search(
                    //     //     history: false,
                    //     //     visit: false,
                    //     //     field: controler.text);
                    //     print("search");
                    //   }
                    //   FocusScope.of(context).unfocus();
                    // },
                    controller: controller,
                    hint: 'Search setting'));
          }),
        )),
  );
}
