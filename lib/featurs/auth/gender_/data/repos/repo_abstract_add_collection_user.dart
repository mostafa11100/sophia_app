import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/firebase_firestore.dart';
import 'package:sophia_chat/featurs/auth/gender_/data/user_model.dart';

abstract class RepoAbstractCollectionOfUser {
  Future<Either<bool, ExeptionsFirebase>> adduserinfo();
}
