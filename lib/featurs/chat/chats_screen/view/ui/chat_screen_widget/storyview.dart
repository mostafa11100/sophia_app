//////////////
///
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/customtextfeildandbutton.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/list_ofstory.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/view/ui/chat_screen_widget/3d_storyview.dart';
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
  PageController? tabcontroller;
  List<StoryItem>? listofitems;
  List<Widget>? listoftab;
  @override
  void dispose() {
    controller!.dispose();
    scrollController!.dispose();
    tabcontroller!.dispose();
    super.dispose();
  }

  SharedPref? pref;

  @override
  void initState() {
    pref = SharedPref();
    scrollController = ScrollController();

    listoftab = [];
    controller = StoryController();
    tabcontroller = PageController(
      initialPage: widget.listOfStorys.index,
    );
    listoftab = List.generate(widget.listOfStorys.listOfStorys.length, (c) {
      return FutureBuilder(
          initialData: null,
          future: pref!.getfromshared('uid'),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              listofitems = [];
              addtolistofitems(
                  controller: controller,
                  listOfStorys: widget.listOfStorys.listOfStorys[c].listofs!,
                  listofitems: listofitems,
                  index: c,
                  usermodel: widget.listOfStorys.listOfStorys[c]);
              if (widget.listOfStorys.listOfStorys[c].uid == snapshot.data) {
                return bodyofcurrentuserstory(
                    child: StoryView(
                      onComplete: () {
                        if (c < widget.listOfStorys.listOfStorys.length - 1) {
                          tabcontroller!.nextPage(
                              duration: Duration(milliseconds: 800),
                              curve: Curves.linear);
                        } else
                          GoRouter.of(context).pop();
                      },

                      //  indicatorOuterPadding: EdgeInsets.all(40),
                      storyItems: listofitems!,
                      controller: controller!,
                    ),
                    usermodel: widget.listOfStorys.listOfStorys[c],
                    controller: controller);
              } else {
                return bodyofstory(
                    usermodel: widget.listOfStorys.listOfStorys[c],
                    child: StoryView(
                      onComplete: () {
                        if (c < widget.listOfStorys.listOfStorys.length - 1) {
                          tabcontroller!.nextPage(
                              duration: Duration(milliseconds: 800),
                              curve: Curves.linear);
                        } else
                          GoRouter.of(context).pop();
                      },

                      //  indicatorOuterPadding: EdgeInsets.all(40),
                      storyItems: listofitems!,
                      controller: controller!,
                    ),
                    controller: controller);
              }
            } else {
              return SizedBox();
            }
          });
    });
    // widget.listOfStorys.listOfStorys.forEach((element) {

    // });
    tabcontroller!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return D3(
      controler: tabcontroller!,
      listofimages: listoftab!,
    );
  }
}

void addtolistofitems(
    {controller,
    context,
    required List<ListOfStorys> listOfStorys,
    listofitems,
    required int index,
    required UserModel usermodel}) {
  for (var element in listOfStorys) {
    StoryItem? storyitem;
    switch (element.type) {
      case "image":
        storyitem = StoryItem.pageImage(
          imageFit: BoxFit.contain,
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
        );
        break;
      case "video":
        storyitem = StoryItem.pageVideo(element.story!,
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
            imageFit: BoxFit.fill);
        break;
      default:
        storyitem = StoryItem.text(
            duration: const Duration(milliseconds: 600),
            title: element.story!,
            backgroundColor: const Color(0x000fffff));
        break;
    }

    ///
    ///
    listofitems.add(storyitem);
//
  }
}

class ListOfStoryModel {
  List<UserModel> listOfStorys;
  int index;
  ListOfStoryModel({required this.listOfStorys, required this.index});
}

Widget bodyofstory({child, required UserModel usermodel, controller}) {
  return Builder(builder: (context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: child,
          ),
          Positioned(top: 50, child: userinfo_story(usermodel: usermodel)),
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
                          usermodel: UserModel.fromjson(json: {}, uid: ''),
                          collectionname: 'chats',
                          feildnamel: 'message',
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
  });
}

Widget bodyofcurrentuserstory(
    {required Widget child, required UserModel usermodel, controller}) {
  return Builder(builder: (context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: child,
          ),
          Positioned(top: 50, child: userinfo_story(usermodel: usermodel)),
        ],
      ),
    ));
  });
}
