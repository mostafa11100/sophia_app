import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/featurs/chat/chat_home_screen.dart';
import 'package:sophia_chat/featurs/profile/view/ui/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: custombuttombar(controller!),
        body: TabBarView(controller: controller, children: [
          ProfileScreen(),
          const Chathome(),
          Container(
            color: Colors.red,
          )
        ]));
  }
}

Widget custombuttombar(TabController control) {
  return StatefulBuilder(builder: (c, s) {
    return TabBar(
        unselectedLabelColor: const Color.fromARGB(255, 88, 88, 88),
        overlayColor: MaterialStateColor.resolveWith(
            (states) => Color(Colors.white.value)),
        labelColor: ColorApp.primarycolor,
        dividerColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        indicatorColor: Colors.white,
        controller: control,
        tabs: const [
          Icon(
            Icons.person,
            size: 31,
          ),

          Icon(Icons.chat_bubble_rounded, size: 29),

          Icon(Icons.settings, size: 29),

          //   ],
        ]);
    // BottomNavigationBar(
    //   currentIndex: ind,
    //   onTap: (i) {
    //     s(() {
    //       ind = i;
    //     });
    //   },
    //   items: [
    //     BottomNavigationBarItem(
    //         icon: Icon(Icons.person),
    //         label: "",
    //         activeIcon: Icon(
    //           Icons.person,
    //           color: ColorApp.primarycolor,
    //         )),
    //     BottomNavigationBarItem(
    //         icon: Icon(
    //           Icons.chat_bubble_rounded,
    //         ),
    //         activeIcon: Icon(
    //           Icons.chat_bubble_rounded,
    //           color: ColorApp.primarycolor,
    //         ),
    //         label: ""),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.settings),
    //       label: "",
    //       activeIcon: Icon(
    //         Icons.settings,
    //         color: ColorApp.primarycolor,
    //       ),
    //     ),
    //   ],
    // );
  });
}
