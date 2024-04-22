// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/chat/search/data/repos/repo_abstract_get_search_result.dart';
import 'package:sophia_chat/featurs/chat/search/view/cubit/cubit_search_in_firestore/cubit/search_in_fire_store_cubit.dart';
import 'package:sophia_chat/featurs/chat/search/view/ui/search_screen_widgets/custom_apppar.dart';
import 'package:sophia_chat/featurs/chat/search/view/ui/search_screen_widgets/history_widget.dart';
import 'package:sophia_chat/featurs/chat/search/view/ui/search_screen_widgets/recent_widget.dart';
import 'package:sophia_chat/featurs/chat/search/view/ui/search_screen_widgets/title_ofbody.dart';
import 'package:sophia_chat/featurs/chat/search/view/ui/search_screen_widgets/topresult_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController controller = TextEditingController();
  Stream<bool> stream = Stream.value(true);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchInFireStoreCubit(getresult: GetTopResultFromFireStore())
            ..search(history: true),
      child: Scaffold(
        appBar: customsearchapppar(context, controller),
        body: SingleChildScrollView(child: bodyofsearchscreen(controller)),
      ),
    );
  }
}

Widget bodyofsearchscreen(TextEditingController? controller) {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocBuilder<SearchInFireStoreCubit, SearchInFireStoreState>(
        builder: (context, state) {
          if (state is SearchInFireStoresucces) {
            // dynamic topresult = state.searchmodel.topresult;
            List<dynamic>? recenthistory =
                state.searchmodel.modelofhistory!.usermodel.searchhistory!;
            List<UserModel>? listofvisited =
                state.searchmodel.modelofhistory!.listofusermodel;
            return Column(
              children: [
                titleofbodyrow(Stream.value(
                    state.searchmodel.topresult == null ? true : false)),
                resultofrecentsearch(
                  listofusers: recenthistory,
                  controller: controller!,
                ),

                state.searchmodel.topresult == null
                    ? historyofsearch(listofusermodel: listofvisited)
                    : topresult(listofusermodel: state.searchmodel.topresult!),

                // historyofsearch(listofusermodel: [UserModel.fromjson(json: {})])
              ],
            );
          } else if (state is SearchInFireStoreloading) {
            return Center(
              child: controller!.text.isEmpty
                  ? Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: ColorApp.primarycolor,
                          ),
                        ),
                      ),
                    )
                  : Row(
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: ColorApp.primarycolor,
                            ),
                          ),
                        ),
                        Text("Searching for  ",
                            style: TextStyleConst.textstyle17.copyWith(
                                color: const Color.fromARGB(255, 26, 25, 25))),
                        Text("'${controller.text}'",
                            style: TextStyleConst.textstyle16
                                .copyWith(color: Colors.black)),
                      ],
                    ),
            );
          }
          if (state is SearchInFireStorefail) {
            return Center(
              child: Text(state.error),
            );
          }
          return Container();
        },
      ),
    );
  });
}
