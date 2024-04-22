import 'dart:io';

import 'package:flutter/material.dart';
import 'package:story_maker/story_maker.dart';

class CreateStory extends StatelessWidget {
  CreateStory({super.key, this.file});
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            StoryMaker(
              filePath: file!.path,
            ),
          ],
        ),
      ),
    );
  }
}
