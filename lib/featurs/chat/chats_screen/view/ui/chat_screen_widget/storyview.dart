import 'package:flutter/material.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/list_ofstory.dart';

// import 'package:story_view/controller/story_controller.dart';
// import 'package:story_view/widgets/story_view.dart';

class StoryView1 extends StatelessWidget {
  StoryView1({super.key, this.listOfStorys});
  List<ListOfStorys>? listOfStorys;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(),
      ),
    );
  }
}

// Widget storyview(storys) {
//   StoryController controller = StoryController();
//   return StoryView(
//     controller: controller,
//     storyItems: ginerateiyems(storys, controller),
//     onStoryShow: (index) {
//       print("Showing a story");
//     },
//     onComplete: () {
//       print("Completed a cycle");
//     },
//     progressPosition: ProgressPosition.bottom,
//     repeat: false,
//     inline: true,
//   );
// }

// List<StoryItem> ginerateiyems(List<ListOfStorys> storys, controller) {
//   List<StoryItem> items = [];
//   storys.forEach((element) {
//     if (element.story == "")
//       // ignore: curly_braces_in_flow_control_structures
//       items.add(
//         StoryItem.text(
//           title: element.caption!,
//           backgroundColor: Colors.orange,
//           roundedTop: true,
//         ),
//       );
//     else
//     // if(element.)   if video
//     if (element.story != "") {
//       items.add(StoryItem.inlineImage(
//         url: element.story!,
//         controller: controller,
//         caption: Text(
//           element.caption!,
//           style: const TextStyle(
//             color: Colors.white,
//             backgroundColor: Colors.black54,
//             fontSize: 17,
//           ),
// //         ),
// //       ));
// //     }
// //   });
// //   return items;
// // }

// var images1 = [
//   'https://firebasestorage.googleapis.com/v0/b/app-monotony.appspot.com/o/assets%2FScreen%20Shot%202020-09-06%20at%2013.24.29.png?alt=media&token=30f1e802-e3f2-4cdb-b95c-b1f886bfeba2',
//   'https://firebasestorage.googleapis.com/v0/b/app-monotony.appspot.com/o/assets%2FScreen%20Shot%202020-09-06%20at%2013.24.48.png?alt=media&token=69743845-dfcb-4245-83bf-3f543715e2bd',
//   'https://firebasestorage.googleapis.com/v0/b/app-monotony.appspot.com/o/assets%2FScreen%20Shot%202020-09-06%20at%2013.27.04.png?alt=media&token=750c65a5-216b-4e6b-840d-8efe10042ed6'
// ];
// var images2 = [
//   'https://firebasestorage.googleapis.com/v0/b/app-monotony.appspot.com/o/assets%2Fmonotony-brand-02.png?alt=media&token=49d1d989-ac74-4d00-a816-e1680172e707',
//   'https://lh3.googleusercontent.com/r87lupz1w9JaLb6_8UZtBWnR1bu4rjC6yWV69pqfSy2PZzB7lAwNjR8fyWyruShu_dk',
//   'https://lh3.googleusercontent.com/vzstCu3rediu8YxljS-3oA7qNDVmet-Wl2VQpoWCOMN4zqirKdOAhNJZXU98Y6QMOiE=s180',
// ];
// Widget viewStoryCustom() {
//   return StoryViewer(
//     padding: EdgeInsets.all(8),
//     backgroundColor: Colors.white,
//     ratio: StoryRatio.r16_9,
//     stories: [
//       StoryItemModel(imageProvider: NetworkImage(images1[0])),
//       StoryItemModel(imageProvider: NetworkImage(images1[1])),
//       StoryItemModel(imageProvider: NetworkImage(images1[2])),
//     ],
//     userModel: UserModel(
//       username: 'flutter',
//       profilePicture: NetworkImage(
//         'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png',
//       ),
//     ),
//   );
// }
