import 'dart:io';

import 'package:either_dart/src/either.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gallery_picker/models/media_file.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/firebase_storage.dart';

abstract class AbstractSendFile {
  sendfile();
}
