import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/search/view/cubit/cubit_search_in_firestore/cubit/search_in_fire_store_cubit.dart';
import 'package:sophia_chat/featurs/chat/search/view/ui/search_screen_widgets/custom_textfeild_search.dart';

AppBar customsearchapppar(context, TextEditingController controler) {
  return AppBar(
    //leadingWidth: 40,
    titleSpacing: 0,
    leading: InkWell(
      onTap: () {
        GoRouter.of(context).pop();
      },
      child: const Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: 38,
      ),
    ),
    backgroundColor: ColorApp.primarycolor,
    title: Text(
      "Search",
      style: TextStyleConst.textstyle33
          .copyWith(color: Colors.white, fontWeight: FontWeight.w800),
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
                    ontap: () {
                      //Stream.value(false);
                      if (controler.text.isNotEmpty) {
                        BlocProvider.of<SearchInFireStoreCubit>(context).search(
                            history: false,
                            visit: false,
                            field: controler.text);
                      }
                      FocusScope.of(context).unfocus();
                    },
                    controller: controler));
          }),
        )),
  );
}
