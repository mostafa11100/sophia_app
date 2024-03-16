import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_groups_state.dart';

class GetGroupsCubit extends Cubit<GetGroupsState> {
  GetGroupsCubit() : super(GetGroupsInitial());
}
