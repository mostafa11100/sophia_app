part of 'get_groups_cubit.dart';

@immutable
sealed class GetGroupsState {}

final class GetGroupsInitial extends GetGroupsState {}

final class GetGroupsLoaing extends GetGroupsState {}

final class GetGroupsSucces extends GetGroupsState {
  List<GroupAndmembersmdoel> groups;
  GetGroupsSucces(this.groups);
}

final class GetGroupsfail extends GetGroupsState {
  String error;
  GetGroupsfail(this.error);
}
