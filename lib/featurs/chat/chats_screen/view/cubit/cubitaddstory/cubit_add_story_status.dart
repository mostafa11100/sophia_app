import 'package:meta/meta.dart';

@immutable
sealed class AddStoryStatus {}

final class AddStoryInital extends AddStoryStatus {}

final class AddStorySucces extends AddStoryStatus {}

final class AddStoryLoading extends AddStoryStatus {}

final class AddStoryFail extends AddStoryStatus {
  String error;
  AddStoryFail(this.error);
}
