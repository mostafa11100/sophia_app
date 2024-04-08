import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:sophia_chat/class/exeptions_firebase.dart';
import 'package:sophia_chat/class/shared_pref.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/Repo/sendmessage_repo.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/repo_sendfile/abstractclass.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/data/repo_sendfile/repo_imp_sendimage_video.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/chat_model.dart';

part 'send_files_state.dart';

class SendFilesCubit extends Cubit<SendFilesState> {
  SendFilesCubit() : super(SendFilesInitial());
  SendMessageToFireStore? sendmessage;
  SharedPref? shared;
  String? downloadurl;
  sendfile({AbstractSendFile? type, dynamic data, docs}) async {
    // shared=SharedPref();
    // String uid=await shared!.getfromshared('uid');
    if (data != null) {
      if (type is sendimageorvideo) {
        Either<List<resultmodel>, ExeptionsFirebase> result =
            await type.sendfile(data: data);
        await result.fold((l) {
          Future.forEach(l, (element) async {
            element.result!.fold((l) {
              //error
              emit(SendFilesfail(l.eror!));
            }, (r) async {
              sendmessage = SendMessageToFireStore();
              downloadurl = await r.ref.getDownloadURL();
              ExeptionsFirebase? re = await sendmessage!.sendmessage(
                  message: MessageModel.tojson(
                          call: false,
                          message: downloadurl,
                          time: Timestamp.now(),
                          seen: false,
                          uid: "jTfN06KUljT13n8wK75mkwPakGm1",
                          image: false,
                          type: element.type)
                      .json,
                  docs: docs);

              //sending message
              //emit(SendFilessuccess());
            });
          });
        }, (r) {
          //error
          SendFilesfail(r.eror!);
        });
      }
    }
  }
}
