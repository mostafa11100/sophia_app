import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/chat/friend_profile/data/repos/update_following.dart';

part 'updat_follwoing_state.dart';

class UpdatFollwoingCubit extends Cubit<UpdatFollwoingState> {
  UpdatFollwoingCubit() : super(UpdatFollwoingInitial());
  UpdateFollwoingData? updateFollwoingData;
  SharedPref? pref;
  update({uid, remove}) async {
    emit(UpdatFollwoingloading());
    ExeptionsFirebase? result;
    pref = SharedPref();
    //  String uid =await pref!.getfromshared('uid');

    updateFollwoingData = UpdateFollwoingData();
    result = await updateFollwoingData!.update(
        feild: "following",
        data: uid,
        docs: "tZxKJrHJamvHp0maq849",
        remove: remove);
    result == null
        ? result = await updateFollwoingData!.update(
            feild: "followers",
            data: "tZxKJrHJamvHp0maq849",
            docs: uid,
            remove: remove)
        : emit(UpdatFollwoingfail(!remove));
    result == null
        ? emit(UpdatFollwoingsucces(remove))
        : emit(UpdatFollwoingfail(!remove));
  }
}
