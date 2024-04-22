import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';
import 'package:sophia_chat/featurs/chat/friend_profile/view/cubit/update_follwing_cubit/cubit/updat_follwoing_cubit.dart';

Widget followcustombuttom(UserModel usermodel) {
  SharedPref pref = SharedPref();
  // String uid=await pref.getfromshared('uid');

  return FutureBuilder(
    initialData: "",
    future: pref.getfromshared('uid'),
    builder: (context, snapshot) {
      bool following = usermodel.followers!.contains(
          snapshot.data == "" || snapshot.data == null
              ? 'tZxKJrHJamvHp0maq849'
              : snapshot.data);
      if (snapshot.data == "") {
        return const SizedBox(
          height: 45,
          width: 100,
        );
      }

      return InkWell(
          onTap: () {
            if (following) {
              print("enter to remove ");

              following = false;
              BlocProvider.of<UpdatFollwoingCubit>(context)
                  .update(uid: usermodel.uid, remove: true);
              usermodel.followers!.remove(usermodel.uid);
            } else {
              following = true;
              BlocProvider.of<UpdatFollwoingCubit>(context)
                  .update(uid: usermodel.uid, remove: false);
            }
          },
          radius: 20,
          child: BlocBuilder<UpdatFollwoingCubit, UpdatFollwoingState>(
            builder: (context, state) {
              if (state is UpdatFollwoingsucces) {
                return animatedcontainercustom(state.remove);
              }
              return animatedcontainercustom(!following);
            },
          ));
    },
  );
}

animatedcontainercustom(following) {
  return AnimatedContainer(
    height: 45,
    width: 100,
    decoration: BoxDecoration(
        color: !following ? Colors.grey : ColorApp.primarycolor,
        borderRadius: BorderRadius.circular(25)),
    duration: const Duration(milliseconds: 250),
    child: Center(
      child: !following
          ? Text(
              "Following",
              style: TextStyleConst.textstyle17.copyWith(
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 245, 242, 242)),
            )
          : Text(
              "Follow",
              style: TextStyleConst.textstyle17
                  .copyWith(fontWeight: FontWeight.w400, color: Colors.white),
            ),
    ),
  );
}
