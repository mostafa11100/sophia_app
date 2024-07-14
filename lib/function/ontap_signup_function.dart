import 'package:go_router/go_router.dart';
import 'package:sophia_chat/approuter.dart';
import 'package:sophia_chat/class/shared_pref.dart';

signupontap(formk, formk2, context, SharedPref pref, controller_email,
    controller_passowrd, controller_name) {
  pref.setinsharedString("name", controller_name.text);

  pref.setinsharedString("email", controller_email.text);

  pref.setinsharedString("password", controller_passowrd.text);

  GoRouter.of(context).pushReplacement(approuter.gender);
}
