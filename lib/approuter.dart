import 'package:go_router/go_router.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/auth/gender_/data/user_model.dart';
import 'package:sophia_chat/featurs/auth/gender_/view/ui/gender_screen.dart';
import 'package:sophia_chat/featurs/auth/sign_up/view/ui/sign_up_screen.dart';
import 'package:sophia_chat/featurs/auth/verify_passowrd/view/ui/forget_passowrd_screen.dart';
import 'package:sophia_chat/featurs/chat/chat_home_screen.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen.dart';
import 'package:sophia_chat/featurs/home/view/ui/home_screen.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_screen.dart';

// ignore: camel_case_types
class approuter {
  static SharedPref? pref;
  static String home = "/home";
  static String chat = "/chat";
  static String signup = "/signup";

  static String login = "/";
  static String gender = "/gender";

  static String verifyemail = "/verifyemail";

  static String forgetpassword = "/forgetpassword";

  static GoRouter routs = GoRouter(
      // redirect: (c, s) async {
      //   pref = SharedPref();
      //   bool? result = await pref!.getfromshared('login');
      //   if (result == null) {
      //     return login;
      //   } else {
      //     return home;
      //   }
      // },
      routes: [
        GoRoute(
            path: home,
            builder: (c, s) {
              return const HomeScreen();
            }),
        GoRoute(
            path: signup,
            builder: (c, s) {
              return SignUpScreen();
            }),
        GoRoute(
            path: login,
            builder: (c, s) {
              return ProfileScreen();
            }),
        GoRoute(
            path: gender,
            builder: (c, s) {
              return GenderScreen();
            }),
        GoRoute(
            path: forgetpassword,
            builder: (c, s) {
              return ForgetPassowrdScreen();
            }),
        GoRoute(
            path: chat,
            builder: (c, s) {
              return ChatScreen(
                usermodel: s.extra as UserModel,
              );
            }),
      ]);
}