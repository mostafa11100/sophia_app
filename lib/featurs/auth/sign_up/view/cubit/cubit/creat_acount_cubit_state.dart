part of 'creat_acount_cubit_cubit.dart';

@immutable
sealed class CreatAcountCubitState {}

final class CreatAcountCubitInitial extends CreatAcountCubitState {}

final class CreatAcountCubitloading extends CreatAcountCubitState {}

// ignore: must_be_immutable
final class CreatAcountCubitfail extends CreatAcountCubitState {
  CreatAcountCubitfail(this.error);
  String error;
}

final class CreatAcountCubitsuccess extends CreatAcountCubitState {
  CreatAcountCubitsuccess(this.credential);
  UserCredential credential;
}
