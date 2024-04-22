import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/search/view/cubit/cubit_search_in_firestore/cubit/search_in_fire_store_cubit.dart';

Widget resultofrecentsearch(
    {required List<dynamic> listofusers,
    ontap,
    required TextEditingController controller}) {
  return Builder(builder: (context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listofusers.length > 4 ? 4 : listofusers.length,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                controller.text = listofusers[i];
                BlocProvider.of<SearchInFireStoreCubit>(context).search(
                    history: false, field: listofusers[i], visit: false);
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 197, 194, 194),
                            width: 1.1))),
                child: Row(
                  children: [
                    const Icon(Icons.search,
                        size: 31, color: Color.fromARGB(255, 134, 134, 134)),
                    Text(
                      listofusers[i],
                      style: TextStyleConst.textstyle18.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "",
                      style: TextStyleConst.textstyle18.copyWith(
                          color: const Color.fromARGB(255, 182, 180, 180),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  });
}
