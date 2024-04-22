part of 'updat_follwoing_cubit.dart';

@immutable
sealed class UpdatFollwoingState {}

final class UpdatFollwoingInitial extends UpdatFollwoingState {}

final class UpdatFollwoingloading extends UpdatFollwoingState {}

final class UpdatFollwoingsucces extends UpdatFollwoingState {
  bool remove;

  UpdatFollwoingsucces(this.remove);
}

final class UpdatFollwoingfail extends UpdatFollwoingState {
  bool remove;

  UpdatFollwoingfail(this.remove);
}
