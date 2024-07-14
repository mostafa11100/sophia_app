import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/const/text_style_const.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      leading: InkWell(
          onTap: () {
            GoRouter.of(context).pushReplacement(approuter.login);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
      trailing: InkWell(
        onTap: () {
          GoRouter.of(context).pushReplacement(approuter.login);
        },
        child: Text(
          "LogIn",
          style: TextStyleConst.textstyle20.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
