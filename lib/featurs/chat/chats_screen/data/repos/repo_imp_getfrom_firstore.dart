// ignore_for_file: implementation_imports, avoid_function_literals_in_foreach_calls

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/getdata_formfirebase.dart';
import 'package:sophia_chat/featurs/auth/gender_/data/user_model.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/chat_model.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_chat.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/repos/repo_abstract.dart';

class GetFromFireStore extends RepoGetData {
  // Future<Either<StreamSubscription<List<UserAndChatModel>>, ExeptionsFirebase>?>
  //     getdataandlisten({uid1}) async {
  //   Either<StreamSubscription<List<UserAndChatModel>>, ExeptionsFirebase>?
  //       eitherofresult;
  //   try {
  //     GetDataFromFirebase getdata = GetDataFromFirebase();
  //     List<UserAndChatModel>? listofmodel = [];
  //     UserAndChatModel? userandchat;
  //     UserModel user;
  //     ChatModel chat;

  //     StreamController<List<UserAndChatModel>> controller =
  //         StreamController<List<UserAndChatModel>>();
  //     StreamSubscription<List<UserAndChatModel>> streamlist =
  //         controller.stream.listen((event) {});

  //     Either<StreamSubscription<QuerySnapshot<Map<String, dynamic>>>, ExeptionsFirebase>
  //         s = await getdata.getdataandlisten(
  //             "chats",
  //             Filter.or(
  //               Filter('uid1', isEqualTo: uid1),
  //               Filter('uid2', isEqualTo: uid1),
  //             ),
  //             "");

  //     await s.fold((left) async {
  //       QuerySnapshot<Map<String, dynamic>>? docs;
  //       left.onData((data) {
  //         docs = data;
  //       });

  //       await Future.forEach(docs!.docs, (element) async {
  //         chat = ChatModel.fromjson(element.data());
  //         String? uid = chat.uid1 == uid1 ? chat.uid2 : chat.uid1;
  //         Either<DocumentSnapshot<Map<String, dynamic>>, ExeptionsFirebase>?
  //             re = await getdata.getdocsdata("user", uid);

  //         await re.fold((left) async {
  //           user = UserModel.fromjson(json: left.data()!);

  //           userandchat = UserAndChatModel(user, chat);

  //           listofmodel.add(userandchat!);
  //         }, (right) async {
  //           eitherofresult = Right(right);
  //         });
  //       });

  //       controller.add(listofmodel);
  //       eitherofresult = Left(streamlist);
  //     }, (right) async {
  //       eitherofresult = Right(right);
  //     });

  //     return eitherofresult;
  //   } catch (e) {
  //     print("exep error");
  //     return Right(ExeptionsFirebase.fromejson(e.toString()));
  //   }
  // }

  @override
  Future<Either<List<UserAndChatModel>, ExeptionsFirebase>?> getdata(
      {uid1}) async {
    Either<List<UserAndChatModel>, ExeptionsFirebase>? eitherofresult;
    try {
      GetDataFromFirebase getdata = GetDataFromFirebase();
      List<UserAndChatModel>? listofmodel = [];
      UserAndChatModel? userandchat;
      UserModel user;
      ChatModel chat;

      Either<QuerySnapshot<Map<String, dynamic>>, ExeptionsFirebase> result =
          await getdata.getdata(
              "chats",
              Filter.or(
                Filter('uid1', isEqualTo: uid1),
                Filter('uid2', isEqualTo: uid1),
              ),
              "");

      await result.fold((left) async {
        await Future.forEach(left.docs, (element) async {
          chat = ChatModel.fromjson(element.data());
          String? uid = chat.uid1 == uid1 ? chat.uid2 : chat.uid1;

          Either<DocumentSnapshot<Map<String, dynamic>>, ExeptionsFirebase>?
              re = await getdata.getdocsdata("user", uid);

          re.fold((left) async {
            user = UserModel.fromjson(json: left.data()!, uid: uid);

            userandchat = UserAndChatModel(user, chat);

            listofmodel.add(userandchat!);
          }, (right) async {
            eitherofresult = Right(right);
          });
        });
        eitherofresult = Left(listofmodel);
      }, (right) async {
        eitherofresult = Right(right);
      });

      return eitherofresult;
    } catch (e) {
      print("exep error");
      return Right(ExeptionsFirebase.fromejson(e.toString()));
    }
  }
}
