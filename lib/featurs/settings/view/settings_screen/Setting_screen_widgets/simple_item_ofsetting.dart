import 'package:flutter/material.dart';
import 'package:sophia_chat/const/text_style_const.dart';

simpleitemofsetting({ontap, title, iconcolor, icondata, textstyle}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: InkWell(
      onTap: ontap,
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: iconcolor,
            child: Icon(
              icondata,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: textstyle ?? TextStyleConst.textstyle17,
          ),
        ],
      ),
    ),
  );
}
