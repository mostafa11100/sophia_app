import 'package:either_dart/either.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';

abstract class RepoGetData {
  Future<Either<dynamic, ExeptionsFirebase>?> getdata();
}
