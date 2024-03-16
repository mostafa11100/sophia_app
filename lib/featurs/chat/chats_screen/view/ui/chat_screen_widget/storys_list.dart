import 'package:flutter/material.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/story_icon_model.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/ui/chat_screen_widget/circle_ofstroy.dart';

class StorysList extends StatelessWidget {
  StorysList({super.key, required this.model, required this.userstory});
  List<StoryModel> model;
  StoryModel userstory;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: CustomCircleAvatarOfStory(
                ontap: () {},
                models: StoryModel.fromjson({
                  'name': "your story",
                  'url': userstory.url,
                  'state': userstory.state
                }),
                visible: false,
                child: const Opacity(
                    opacity: 0.7,
                    child: Icon(
                      Icons.add,
                      size: 34,
                    ))),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: model.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (c, i) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: CustomCircleAvatarOfStory(
                    models: StoryModel.fromjson({
                      'name': model[i].name,
                      'url': "",
                      'state': model[i].state
                    }),
                    ontap: () {},
                    visible: true,
                    child: Image.network(
                      model[i].url!,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
