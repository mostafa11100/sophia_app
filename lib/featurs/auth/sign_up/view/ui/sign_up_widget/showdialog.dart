import 'package:flutter/material.dart';
import 'package:sophia_chat/const/text_style_const.dart';

showd(context, error) {
  return showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          title: Text(
            "error",
            style: TextStyleConst.textstyle16.copyWith(color: Colors.red),
          ),
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ),
          content: Text(
            error,
            style: TextStyleConst.textstyle16.copyWith(color: Colors.red),
          ),
        );
      });
}
