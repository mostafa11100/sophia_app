import 'package:flutter/material.dart';

Widget GroupMemberImagesList(List<String> url) {
  return Stack(
    children: List.generate(
      url.length,
      (index) {
        return Padding(
          padding: EdgeInsets.only(left: (index.toDouble()) * 20),
          child: CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(url[index]),
          ),
        );
      },
    ),
  );
}
