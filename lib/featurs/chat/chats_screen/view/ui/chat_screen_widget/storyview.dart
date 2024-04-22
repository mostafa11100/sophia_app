// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/customtextfeildandbutton.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/list_ofstory.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/ui/chat_screen_widget/user_info_story.dart';
import "package:story_view/story_view.dart";

class StoryView1 extends StatefulWidget {
  StoryView1({super.key, required this.listOfStorys});
  ListOfStoryModel listOfStorys;
  @override
  State<StoryView1> createState() => _StoryView1State();
}

class _StoryView1State extends State<StoryView1>
    with SingleTickerProviderStateMixin {
  StoryController? controller;

  ScrollController? scrollController;
  TabController? tabcontroller;
  List<StoryItem>? listofitems;
  List<Widget>? listoftab;
  @override
  void initState() {
    scrollController = ScrollController();

    listoftab = [];
    controller = StoryController();
    tabcontroller = TabController(
        initialIndex: widget.listOfStorys.index,
        length: widget.listOfStorys.listOfStorys.length,
        vsync: this);
    listoftab = List.generate(widget.listOfStorys.listOfStorys.length, (c) {
      listofitems = [];
      addtolistofitems(
          controller: controller,
          listOfStorys: widget.listOfStorys.listOfStorys[c].listofs!,
          listofitems: listofitems);

      return StoryView(
        onComplete: () {
          if (c < widget.listOfStorys.listOfStorys.length - 1) {
            print(c);

            tabcontroller!.animateTo(1);
          }
        },

        //  indicatorOuterPadding: EdgeInsets.all(40),
        storyItems: listofitems!,
        controller: controller!,
      );
    });
    // widget.listOfStorys.listOfStorys.forEach((element) {

    // });
    tabcontroller!.addListener(() {
      print("ccccc  ${tabcontroller!.index}");
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("enter to scaffold    ${widget.listOfStorys.listOfStorys.length}");
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: TabBarView(controller: tabcontroller, children: listoftab!),
          ),
          Positioned(
              top: 50,
              child: userinfo_story(
                  usermodel:
                      widget.listOfStorys.listOfStorys[tabcontroller!.index])),
          Positioned(
            bottom: 10,
            left: (MediaQuery.of(context).size.width / 2) - 20,
            child: InkWell(
              onTap: () {
                controller!.pause();

                showModalBottomSheet(
                    //     // isDismissible: true,
                    isScrollControlled: true,
                    backgroundColor: const Color.fromARGB(255, 12, 24, 34),
                    context: context,
                    builder: (c) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: CustomTextFeildMessage(
                          docs: "",
                          autofocus: true,
                        ),
                      );
                    });
              },
              child: Text(
                "Replay",
                style: TextStyleConst.textstyle17.copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

void addtolistofitems(
    {controller, required List<ListOfStorys> listOfStorys, listofitems}) {
  for (var element in listOfStorys!) {
    switch (element.type) {
      case "image":
        listofitems!.add(StoryItem.pageImage(
            shown: true,
            captionOuterPadding: const EdgeInsets.all(20),
            caption: Text(
              element.caption!,
              style: TextStyleConst.textstyle17.copyWith(color: Colors.white),
            ),
            url: element.story!,
            controller: controller!,
            loadingWidget: const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
            imageFit: BoxFit.fill));
        break;
      case "video":
        listofitems!.add(StoryItem.pageVideo(element.story!,
            controller: controller!,
            loadingWidget: const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
            caption: Text(
              element.caption!,
              style: TextStyleConst.textstyle17.copyWith(color: Colors.white),
            ),
            duration: const Duration(milliseconds: 600),
            imageFit: BoxFit.fill));
        break;
      default:
        listofitems!.add(StoryItem.text(
            duration: const Duration(milliseconds: 600),
            title: element.story!,
            backgroundColor: const Color(0x000fffff)));
        break;
    }
  }
}

class ListOfStoryModel {
  List<UserModel> listOfStorys;
  int index;
  ListOfStoryModel({required this.listOfStorys, required this.index});
}
