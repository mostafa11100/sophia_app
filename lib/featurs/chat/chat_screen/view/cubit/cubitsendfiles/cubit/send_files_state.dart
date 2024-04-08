part of 'send_files_cubit.dart';

@immutable
sealed class SendFilesState {}

final class SendFilesInitial extends SendFilesState {}

final class SendFileslodaing extends SendFilesState {}

final class SendFilessuccess extends SendFilesState {}

final class SendFilesfail extends SendFilesState {
  String error;
  SendFilesfail(this.error);
}
