import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/class/modelofgroupprametar.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/auth/gender_/view/ui/gender_screen.dart';
import 'package:sophia_chat/featurs/auth/log_in/view/ui/login_screen.dart';
import 'package:sophia_chat/featurs/auth/sign_up/view/ui/sign_up_screen.dart';
import 'package:sophia_chat/featurs/auth/verify_passowrd/view/ui/forget_passowrd_screen.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/ui/chat_screen_widget/storyview.dart';
import 'package:sophia_chat/featurs/chat/friend_profile/view/ui/profilefriend_screen.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/creategroup_screen.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/group_chat_screen.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/group_profile.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/groupscreen_widget/group_settings.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/mmodelforgroup.dart';
import 'package:sophia_chat/featurs/chat/search/view/ui/search_screen.dart';
import 'package:sophia_chat/featurs/home/view/ui/home_screen.dart';
import 'package:sophia_chat/featurs/settings/view/settings_screen/Setting_screen_widgets/profileUpdate.dart';
import 'package:sophia_chat/utilits/gineral_choise_photo_from_gallery.dart';

// ignore: camel_case_types
class approuter {
  static SharedPref? pref;
  static String home = "/home";
  static String groupchat = "/groupchat";
  static String chat = "/chat";
  static String signup = "/signup";
  static String groupprofile = "/groupprofile";

  static String login = "/";
  static String profilefriend = "/profilef";
  static String gender = "/gender";

  static String verifyemail = "/verifyemail";

  static String storyview = "/storyview";

  static String forgetpassword = "/forgetpassword";
  static String search = "/searchscreen";

  static String profileedite = "/profileedite";
  static String listoffriends = "/listoffriends";
  static String groupsetting = "/groupsetting";
  static String reviewscreen = "/reviewscreen";
  static GoRouter routs = GoRouter(

      // redirect: (c, s) async {
      //   pref = SharedPref();
      //   bool? result = await pref!.getfromshared('login');
      //   if (result == null && s.path == null) {
      //     print("not log in ${s.path}");
      //     return login;
      //   } else {
      //     return s.path;
      //   }
      // },
      routes: [
        GoRoute(
          path: groupprofile,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                transitionDuration: Duration(milliseconds: 800),
                reverseTransitionDuration: Duration(milliseconds: 800),
                child: GroupProfile(
                  groupmodel: state.extra as groupandmembersmodel,
                ),
                transitionsBuilder: (
                  c,
                  an1,
                  an2,
                  widget,
                ) {
                  const begin = 0.0;
                  const end = 1.0;
                  const curve = Curves.easeInQuad;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return FadeTransition(
                    opacity: an1.drive(tween),
                    child: widget,
                  );
                });
          },
        ),
        GoRoute(
          path: home,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: HomeScreen(),
                transitionsBuilder: (c, an1, an2, widget) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: an1.drive(tween),
                    child: widget,
                  );
                });
          },
        ),
        GoRoute(
          path: groupchat,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: GroupChatScreen(
                  modelofgroupprametar: state.extra as Modelofgroupprametar,
                ),
                transitionsBuilder: (c, an1, an2, widget) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: an1.drive(tween),
                    child: widget,
                  );
                });
          },
        ),
        GoRoute(
          path: reviewscreen,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: ReviewImage(
                  file: state.extra! as File,
                ),
                transitionsBuilder: (c, an1, an2, widget) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: an1.drive(tween),
                    child: widget,
                  );
                });
          },
        ),
        GoRoute(
          path: signup,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: SignUpScreen(),
                transitionsBuilder: (c, an1, an2, widget) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: an1.drive(tween),
                    child: widget,
                  );
                });
          },
        ),
        GoRoute(
          path: login,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: LogInScreen(),
                transitionsBuilder: (c, an1, an2, widget) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: an1.drive(tween),
                    child: widget,
                  );
                });
          },
        ),
        GoRoute(
          path: gender,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: GenderScreen(),
                transitionsBuilder: (c, an1, an2, widget) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: an1.drive(tween),
                    child: widget,
                  );
                });
          },
        ),
        GoRoute(
          path: forgetpassword,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: ForgetPassowrdScreen(),
                transitionsBuilder: (c, an1, an2, widget) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: an1.drive(tween),
                    child: widget,
                  );
                });
          },
        ),
        GoRoute(
          path: chat,
          name: chat,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: ChatScreen(
                  usermodel: state.extra as UserModel,
                ),
                transitionsBuilder: (c, an1, an2, widget) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: an1.drive(tween),
                    child: widget,
                  );
                });
          },
        ),
        GoRoute(
          path: profilefriend,
          pageBuilder: (c, s) {
            return CustomTransitionPage(
                child: ProfileFriendScreen(
                  usermodel: s.extra as UserModel,
                ),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  Offset b = Offset(1.0, 0.0);

                  Offset e = Offset(0.0, 0.0);
                  Tween<Offset> tween = Tween(begin: b, end: e);
                  CurvedAnimation curvedAnimation =
                      CurvedAnimation(parent: animation, curve: Curves.linear);
                  return SlideTransition(
                    position: tween.animate(curvedAnimation),
                    child: child,
                  );
                });
          },
        ),
        GoRoute(
          path: storyview,
          pageBuilder: (c, s) {
            return CustomTransitionPage(
                child: StoryView1(listOfStorys: s.extra as ListOfStoryModel),
                transitionsBuilder: (context, animation, animation2, child) {
                  Offset begain = Offset(0.0, 1.0);

                  Offset end = Offset.zero;
                  Tween<Offset> tween = Tween(begin: begain, end: end);
                  CurvedAnimation curvedAnimation =
                      CurvedAnimation(parent: animation, curve: Curves.linear);

                  return SlideTransition(
                    position: tween.animate(curvedAnimation),
                    child: child,
                  );
                });
          },
        ),
        GoRoute(
          path: search,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: SearchScreen(),
                transitionsBuilder: (context, animation, an2, child) {
                  Offset begain = Offset(1.0, 0.0);
                  Offset end = Offset.zero;
                  Tween<Offset> tween = Tween(begin: begain, end: end);
                  CurvedAnimation curvedanimation =
                      CurvedAnimation(parent: animation, curve: Curves.linear);

                  return SlideTransition(
                    position: tween.animate(curvedanimation),
                    child: child,
                  );
                });
          },
        ),
        GoRoute(
          path: profileedite,
          pageBuilder: (c, s) {
            return CustomTransitionPage(
                child: ProfileUpdate(usermodel: s.extra as UserModel),
                transitionsBuilder: (context, animation, an2, child) {
                  Offset begain = Offset(1.0, 0.0);
                  Offset end = Offset.zero;
                  Tween<Offset> tween = Tween(begin: begain, end: end);
                  CurvedAnimation curvedanimation =
                      CurvedAnimation(parent: animation, curve: Curves.linear);

                  return SlideTransition(
                    position: tween.animate(curvedanimation),
                    child: child,
                  );
                });
          },
        ),
        GoRoute(
          path: listoffriends,
          pageBuilder: (c, s) {
            return CustomTransitionPage(
                child: CreategroupScreen(userdata: s.extra as UserModel),
                transitionsBuilder: (context, animation, an2, child) {
                  Offset begain = Offset(1.0, 0.0);
                  Offset end = Offset.zero;
                  Tween<Offset> tween = Tween(begin: begain, end: end);
                  CurvedAnimation curvedanimation =
                      CurvedAnimation(parent: animation, curve: Curves.linear);

                  return SlideTransition(
                    position: tween.animate(curvedanimation),
                    child: child,
                  );
                });
          },
        ),
        GoRoute(
          path: groupsetting,
          pageBuilder: (c, s) {
            return CustomTransitionPage(
                child: GrpupSetting(
                  userandmembers: s.extra as UserandMembers,
                ),
                transitionsBuilder: (context, animation, an2, child) {
                  Offset begain = Offset(1.0, 0.0);
                  Offset end = Offset.zero;
                  Tween<Offset> tween = Tween(begin: begain, end: end);
                  CurvedAnimation curvedanimation =
                      CurvedAnimation(parent: animation, curve: Curves.linear);

                  return SlideTransition(
                    position: tween.animate(curvedanimation),
                    child: child,
                  );
                });
          },
        )
      ]);
}
