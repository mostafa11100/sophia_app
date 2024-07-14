import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';

Widget voicemessage(user1, urlimge, audiourl, String time) {
  AudioPlayer? player = AudioPlayer(useProxyForRequestHeaders: true);
  player.setUrl(audiourl);
  bool play = false;
  return StatefulBuilder(builder: (context, i) {
    return Container(
        padding: const EdgeInsets.only(
          top: 6,
          bottom: 6,
          right: 7,
        ),
        decoration: BoxDecoration(
            color: ColorApp.primarycolor2,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            border: Border.all(color: ColorApp.primarycolor)),
        height: 67,
        width: MediaQuery.of(context).size.width / 1.4,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          StreamBuilder<Duration?>(
              initialData: Duration.zero,
              stream: player.durationStream,
              builder: (context, snapshot1) {
                return SizedBox(
                  height: 67,
                  width: (MediaQuery.of(context).size.width / 1.4) / 1.6,
                  child: StreamBuilder(
                    initialData: Duration.zero,
                    builder: (context, snapshot) {
                      print(snapshot.data!.inSeconds.toDouble());
                      // final processingState = playerState?.processingState;
                      // print(s.data!.toDouble());
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Slider(
                              activeColor:
                                  const Color.fromARGB(255, 146, 145, 145),
                              thumbColor:
                                  const Color.fromARGB(255, 146, 145, 145),
                              inactiveColor:
                                  const Color.fromARGB(255, 146, 145, 145),
                              min: 0,
                              max: snapshot1.data!.inSeconds.toDouble(),
                              divisions: 10,
                              value: snapshot.data!.inSeconds.toDouble(),
                              onChanged: (i) {
                                if (i == snapshot1.data!.inSeconds) {
                                  player.seek(const Duration(seconds: 0));
                                } else {
                                  player.seek(Duration(seconds: i.toInt()));
                                }
                              }),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              children: [
                                Text(
                                  time,
                                  style: TextStyleConst.textstyle12.copyWith(
                                    height: .3,
                                    color: const Color.fromARGB(
                                        255, 146, 145, 145),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                    snapshot.data!.inSeconds == 0
                                        ? "${snapshot1.data!.inMinutes}:${snapshot1.data!.inSeconds}"
                                        : "${snapshot.data!.inMinutes}:${snapshot.data!.inSeconds}",
                                    style: TextStyleConst.textstyle12.copyWith(
                                      height: .3,
                                      color: const Color.fromARGB(
                                          255, 146, 145, 145),
                                    ))
                              ],
                            ),
                          )
                        ],
                      );
                    },
                    stream: player.positionStream,
                  ),
                );
              }),
          StreamBuilder<PlayerState>(
              stream: player.playerStateStream,
              builder: (context, snapshot) {
                final playerstate = player.playerState;
                final stateprocces = playerstate.processingState;

                if (stateprocces == ProcessingState.completed) {
                  player.stop();

                  play = play ? false : true;
                  player.seek(Duration.zero);
                }
                if (stateprocces == ProcessingState.loading ||
                    stateprocces == ProcessingState.buffering) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Color.fromARGB(255, 231, 238, 243),
                        ),
                      ),
                    ),
                  );
                }
                return InkWell(
                  onTap: () async {
                    try {
                      play = play ? false : true;
                      if (play == true) {
                        if (stateprocces == ProcessingState.completed) {
                          await player.pause();
                        } else {
                          await player.play();
                        }
                      } else {
                        await player.stop();
                      }
                    } on PlayerException catch (e) {
                      // iOS/macOS: maps to NSError.code
                      // Android: maps to ExoPlayerException.type
                      // Web: maps to MediaError.code
                      // Linux/Windows: maps to PlayerErrorCode.index

                      // iOS/macOS: maps to NSError.localizedDescription
                      // Android: maps to ExoPlaybackException.getMessage()
                      // Web/Linux: a generic message
                      // Windows: MediaPlayerError.message
                    } on PlayerInterruptedException catch (e) {
                      // This call was interrupted since another audio source was loaded or the
                      // player was stopped or disposed before this audio source could complete
                      // loading.
                    } catch (e) {
                      // Fallback for all other errors
                    }
                  },
                  child: Icon(
                      play == true && stateprocces != ProcessingState.completed
                          ? Icons.pause
                          : Icons.play_arrow_rounded,
                      size: MediaQuery.of(context).size.width / 9,
                      color: const Color.fromARGB(255, 146, 145, 145)),
                );
              }),
          CircleAvatar(
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            backgroundImage: NetworkImage(urlimge),
            radius: MediaQuery.of(context).size.width / 16,
          ),
        ]));
  });
}
