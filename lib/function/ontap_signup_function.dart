import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/auth/sign_up/view/cubit/cubit/creat_acount_cubit_cubit.dart';

signupontap(formk, formk2, context, pref, controller_email, controller_passowrd,
    controller_name) {
  pref.setinshared("name", controller_name.text);

  pref.setinshared("email", controller_email.text);

  pref.setinshared("password", controller_passowrd.text);

  GoRouter.of(context).pushReplacement(approuter.gender);
}
