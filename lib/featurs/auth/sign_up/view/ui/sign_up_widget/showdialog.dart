import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:sophia_chat/utilits/alertdialog_gineraluse.dart';

showd(context, error) {
  showawesamedialog(
      context: context,
      ontap1: () {},
      ontap2: null,
      content: error,
      title: "error",
      dialogType: DialogType.error);
}
