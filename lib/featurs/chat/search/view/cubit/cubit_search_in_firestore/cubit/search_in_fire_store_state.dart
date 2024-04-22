// ignore_for_file: must_be_immutable

part of 'search_in_fire_store_cubit.dart';

@immutable
sealed class SearchInFireStoreState {}

final class SearchInFireStoreInitial extends SearchInFireStoreState {}

final class SearchInFireStoreloading extends SearchInFireStoreState {}

final class SearchInFireStoresucces extends SearchInFireStoreState {
  SearchScreenModel searchmodel;
  SearchInFireStoresucces(this.searchmodel);
}

final class SearchInFireStorefail extends SearchInFireStoreState {
  String error;
  SearchInFireStorefail(this.error);
}
