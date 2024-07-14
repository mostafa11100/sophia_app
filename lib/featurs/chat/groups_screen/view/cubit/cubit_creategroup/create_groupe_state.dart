import 'package:meta/meta.dart';

@immutable
sealed class CreateGrupeState {}

class CreateGroupeIntial extends CreateGrupeState {}

class CreateGroupeLoading extends CreateGrupeState {}

class CreateGroupeSucces extends CreateGrupeState {}

class CreateGroupefail extends CreateGrupeState {
  String error;
  CreateGroupefail(this.error);
}
