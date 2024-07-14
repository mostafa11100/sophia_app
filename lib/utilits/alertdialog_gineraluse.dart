import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';

// showdialogalarm(
//     {required context,
//     required ontap1,
//     required ontap2,
//     required text1,
//     required text2,
//     required Widget content,
//     required Widget title}) {
//   showDialog(
//       context: context,
//       builder: (context1) {
//         return AlertDialog(
//           contentPadding: EdgeInsets.all(10),
//           backgroundColor: ColorApp.greycolor,
//           actionsAlignment: MainAxisAlignment.center,
//           actions: [
//             InkWell(
//               onTap: ontap1,
//               child: Container(
//                 height: 40,
//                 width: 120,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: ColorApp.primarycolor),
//                 child: Center(
//                   child: Text(
//                     text1,
//                     style: TextStyleConst.textstyle18
//                         .copyWith(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//             Spacer(),
//             InkWell(
//               onTap: ontap2,
//               child: Container(
//                 height: 40,
//                 width: 120,
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 223, 221, 221),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Center(
//                   child: Text(
//                     text2,
//                     style: TextStyleConst.textstyle18,
//                   ),
//                 ),
//               ),
//             )
//           ],
//           title: title,
//           content: Container(
//               constraints: BoxConstraints(maxHeight: 150), child: content),
//         );
//       });
// }

void showawesamedialog(
    {required context,
    ontap1,
    ontap2,
    String? content,
    String? title,
    required DialogType dialogType}) {
  AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.scale,
    title: title,
    desc: content,
    btnCancelOnPress: ontap2,
    btnOkOnPress: ontap1,
  )..show();
}
