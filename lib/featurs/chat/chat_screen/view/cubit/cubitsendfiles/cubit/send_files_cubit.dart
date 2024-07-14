import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/Repo/sendmessage_repo.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/repo_sendfile/abstractclass.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/repo_sendfile/repo_imp_sendimage_video.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/repo_sendfile/repo_sendfiles_gineral.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/chat_model.dart';

part 'send_files_state.dart';

class SendFilesCubit extends Cubit<SendFilesState> {
  SendFilesCubit() : super(SendFilesInitial());
  SendMessageToFireStore? sendmessage;
  SharedPref? shared;
  String? downloadurl;
  Future<bool> sendfile(
      {AbstractSendFile? type,
      dynamic data,
      message,
      docs,
      required colectionname,
      required feildname}) async {
    shared = SharedPref();
    String uid = await shared!.getfromshared('uid');
    if (data != null) {
      if (type is sendimageorvideo) {
        Either<List<resultmodel>, ExeptionsFirebase> result =
            await type.sendfile(data: data);
        result.fold((l) {
          int i = 0;
          Future.forEach(l, (element) async {
            element.result!.fold((l) {
              //error
              emit(SendFilesfail(l.eror!));
            }, (r) async {
              if (i == l.length - 1) {
                sendmessageabouttypefile(
                    r, element, message, docs, colectionname, feildname);
              } else {
                sendmessageabouttypefile(
                    r, element, "", docs, colectionname, feildname);
              }
              //sending message
              //emit(SendFilessuccess());
            });
            i++;
          });
        }, (r) {
          //error
          SendFilesfail(r.eror!);
        });
      }

      //////////////////////000000
      //-------------------------------------------------
      if (type is SendFilesGineral) {
        Either<List<resultmodel>, ExeptionsFirebase> result =
            await type.sendfile(data: data);
        result.fold((l) {
          Future.forEach(l, (element) async {
            element.result!.fold((l) {
              emit(SendFilesfail(l.eror!));
            }, (r) async {
              sendmessageabouttypefile(
                  r, element, message, docs, colectionname, feildname);
              //sending message
              //emit(SendFilessuccess());
            });
          });
        }, (r) {
          //error
          SendFilesfail(r.eror!);
        });
      }

      ///===-=-==-=-=-=-=-=-=-=-=-=-=
      if (type == null) {
        sendmessage = SendMessageToFireStore();
        await sendmessage!.sendmessage(
            message: MessageModel.tojson(
                    call: false,
                    message: message,
                    time: Timestamp.now(),
                    seen: false,
                    uid: uid,
                    image: false,
                    type: "gif",
                    url: data)
                .json,
            docs: docs,
            docsname: colectionname,
            feildname: feildname);
      }
    }
    return true;
  }
}

sendmessageabouttypefile(
    r, element, message, docs, collectionname, feildname) async {
  SendMessageToFireStore? sendmessage;
  SharedPref shared = SharedPref();
  String uid = await shared.getfromshared('uid');
  String? downloadurl;
  sendmessage = SendMessageToFireStore();
  downloadurl = await r.ref.getDownloadURL();
  await sendmessage.sendmessage(
      message: MessageModel.tojson(
              call: false,
              message: message,
              time: Timestamp.now(),
              seen: false,
              uid: uid,
              image: false,
              url: downloadurl,
              type: element.type)
          .json,
      docs: docs,
      docsname: collectionname,
      feildname: feildname);
}
