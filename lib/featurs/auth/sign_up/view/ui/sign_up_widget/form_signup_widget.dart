// // ignore_for_file: non_constant_identifier_names

// import 'package:flutter/material.dart';
// import 'package:sophia_chat/featurs/auth/sign_up/view/ui/sign_up_widget/email_form.dart';
// import 'package:sophia_chat/featurs/auth/sign_up/view/ui/sign_up_widget/passowrd_form.dart';

// // ignore: must_be_immutable
// class FormSignUp extends StatelessWidget {
//   const FormSignUp(
//       {super.key,
//       required this.formk,
//       this.controller_name,
//       this.controller_email,
//       this.controller_passowrd,
//       this.controller_confirmpass,
//       required this.formk2});
//   final GlobalKey<FormState> formk;
//   final GlobalKey<FormState> formk2;
//   final TextEditingController? controller_name;

//   final TextEditingController? controller_email;

//   final TextEditingController? controller_passowrd;

//   final TextEditingController? controller_confirmpass;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         EmailForm(
//             formk: formk,
//             controller_name: controller_name!,
//             controller_email: controller_email!),
//         PasswordForm(
//           controller_passowrd: controller_passowrd,
//           controller_confirmpass: controller_confirmpass,
//           formk2: formk2,
//         ),
//       ],
//     );
//   }
// }
