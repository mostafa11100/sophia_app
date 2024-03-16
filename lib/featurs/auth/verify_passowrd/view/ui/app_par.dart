import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/const/text_style_const.dart';

class AppBarcustom extends StatelessWidget {
  const AppBarcustom({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: InkWell(
          onTap: () {
            GoRouter.of(context).pushReplacement(approuter.login);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
      trailing: Text(
        "LogIn",
        style: TextStyleConst.textstyle16.copyWith(color: Colors.black),
      ),
    );
  }
}
