import 'package:flutter/material.dart';
import 'package:sophia_chat/featurs/chat/calls_screen/view/ui/call_screen.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/ui/chat_screen.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/ui/chat_screen_widget/app_bar_widget.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/group_screen.dart';

class Chathome extends StatefulWidget {
  const Chathome({super.key});

  @override
  State<Chathome> createState() => _ChathomeState();
}

class _ChathomeState extends State<Chathome>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController =
        TabController(animationDuration: Duration.zero, length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarChatCustom(context, tabController),
        body: TabBarView(controller: tabController, children: const [
          BodyOfChatScreen(),
          GroupScreen(),
          CallScreen(),
        ]));
  }
}
