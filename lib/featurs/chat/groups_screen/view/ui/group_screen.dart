import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/data/models/grop_model.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/cubit/cubit/get_groups_cubit.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/groupscreen_widget/creategroup_icon.dart';
import 'package:sophia_chat/featurs/chat/groups_screen/view/ui/groupscreen_widget/group_icond.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(207, 229, 230, 231),
      padding: const EdgeInsets.all(25),
      child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 7,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            mainAxisExtent: 190,
          ),
          itemBuilder: (c, i) {
            return i == 0
                ? CreateGroupeICon()
                : GroupIcon(GroupModel.fromjson(json: null));
          }),
    );
  }
}
