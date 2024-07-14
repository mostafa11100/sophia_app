import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sophia_chat/utilits/gineral_choise_photo_from_gallery.dart';

class SelectAndAddstoryScreen extends StatelessWidget {
  SelectAndAddstoryScreen({super.key, this.streamphoto});
  StreamController<File?>? streamphoto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGalleryViewgineral(
        stream: streamphoto,
        position: 1,
      ),
    );
  }
}
