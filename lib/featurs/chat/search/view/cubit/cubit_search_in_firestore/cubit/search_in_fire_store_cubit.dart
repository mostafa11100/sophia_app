import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/chat/search/data/repos/repo_abstract_get_search_result.dart';
import 'package:sophia_chat/featurs/chat/search/data/repos/repo_update_search_result.dart';
import 'package:sophia_chat/featurs/chat/search/data/repos/repos_getdata.dart';

part 'search_in_fire_store_state.dart';

class SearchInFireStoreCubit extends Cubit<SearchInFireStoreState> {
  SearchInFireStoreCubit({required this.getresult})
      : super(SearchInFireStoreInitial());
  UpdateHistory? update;
  GetResultOfSearch getresult;
  GetUserDataFromFireStore? getuserdata;
  SharedPref? pref;
  search({UserModel? usermodel, field, visit, required bool history}) async {
    getuserdata = GetUserDataFromFireStore();

    List<UserModel>? listofusers;
    pref = SharedPref();
    update = UpdateHistory();
    pref = SharedPref();
    String uid = await pref!.getfromshared('uid');
    try {
      emit(SearchInFireStoreloading());
      if (!history) {
        if (!visit) {
          if (getresult is GetTopResultFromFireStore) {
            Either<List<UserModel>, ExeptionsFirebase> result =
                await getresult.getresult(field: field);

            await result.fold((left) async {
              listofusers = left;

              await update!
                  .update(field: "searchhistory", docs: uid, data: field);
            }, (right) {
              emit(SearchInFireStorefail(right.eror!));
            });
          }
        } else {
          await update!
              .update(field: "searchhistory", docs: uid, data: usermodel!.uid);
        }
      }
      Either<ExeptionsFirebase, ModelOfHistory>? resulthistory =
          await getuserdata!.getdata(uid);
      resulthistory!.fold((left) {
        emit(SearchInFireStorefail(left.eror!));
      }, (right) {
        //   print("right ${right.listofusermodel[0].name}");

        emit(SearchInFireStoresucces(
            SearchScreenModel(topresult: listofusers, modelofhistory: right)));
      });
      // get search history all
      //1 get uid histpry

      //get visited
      //3 get users visited by uid
    } catch (e) {
      emit(SearchInFireStorefail(e.toString()));
    }
  }
}

class SearchScreenModel {
  List<UserModel>? topresult;
  ModelOfHistory? modelofhistory;
  SearchScreenModel({required this.topresult, required this.modelofhistory});
}
