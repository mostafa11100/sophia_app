// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:story_maker/story_maker.dart';

class CustomGalleryViewgineral extends StatefulWidget {
  CustomGalleryViewgineral(
      {super.key, required this.stream, this.position = .5});

  StreamController<File?>? stream;
  double? position;
  @override
  State<CustomGalleryViewgineral> createState() =>
      _DraggableScrollViewCustomState();
}

class _DraggableScrollViewCustomState extends State<CustomGalleryViewgineral> {
  DraggableScrollableController? control;

  @override
  void initState() {
    control = DraggableScrollableController();
    control!.addListener(() {
      if (control!.pixels > MediaQuery.of(context).size.height / 2) {
        setState(() {
          widget.position = 1;
          control!.jumpTo(1);
        });
      }
    });

    super.initState();
  }

  String? id;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        controller: control,
        //expand: true,
        initialChildSize: widget.position!,
        maxChildSize: 1,
        minChildSize: .5,
        builder: (c, cc) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widget.position == 1.0 ? 0 : 40),
                topRight: Radius.circular(widget.position == 1.0 ? 0 : 40)),
            child: Scaffold(
              backgroundColor: Color.fromARGB(255, 245, 242, 242),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  controller: cc,
                  child: FutureBuilder<List<MediaFile>>(
                      initialData: null,
                      future: getalbums(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return customloadingimages(context);
                        }
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "All Photos",
                                    style: TextStyleConst.textstyle20
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "open Camera",
                                    style: TextStyleConst.textstyle18.copyWith(
                                        color: ColorApp.primarycolor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            selectphoto(snapshot.data!, context, widget.stream)
                          ],
                        );
                      }),
                ),
              ),
            ),
          );
        });
  }
}

Widget selectphoto(
    List<MediaFile> items, context, StreamController<File?>? file) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: GridView.builder(
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (BuildContext context, int index) {
        return FutureBuilder(
          initialData: null,
          builder: (context, snapshot) {
            return snapshot.data == null
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: const Color.fromARGB(255, 238, 236, 236),
                    ),
                  )
                : InkWell(
                    onTap: () async {
                      // GoRouter.of(context)
                      //     .push(approuter.reviewscreen, extra: file);
                      File? ff = await Navigator.of(context)
                          .push(MaterialPageRoute(builder: (c) {
                        return StoryMaker(
                          doneButtonChild: Center(
                              child: InkWell(
                            onTap: () {},
                            child:
                                Text("Done", style: TextStyleConst.textstyle16),
                          )),
                          filePath: snapshot.data!.path,
                        );

                        // ReviewImage(
                        //   file: snapshot.data,
                        //   stream: file,
                        // );
                      }));
                      if (ff != null) {
                        file!.add(ff);

                        GoRouter.of(context).pop();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(snapshot.data!))),
                    ),
                  );
          },
          future: items[index].getFile(),
        );
      },
    ),
  );
}

Widget customloadingimages(context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
          child: Row(
            children: [
              Text(
                "All Photos",
                style: TextStyleConst.textstyle20
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              Text(
                "open Camera",
                style: TextStyleConst.textstyle18.copyWith(
                    color: ColorApp.primarycolor, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                itemBuilder: (context, i) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: const Color.fromARGB(255, 238, 236, 236),
                    ),
                  );
                })),
      ],
    ),
  );
}

Future<List<MediaFile>> getalbums() async {
  //

  // ignore: unused_local_variable
  List<MediaFile>? listofalbums = [];
  GalleryMedia? allmedia = await GalleryPicker.collectGallery();

  for (var album in allmedia!.albums) {
    for (var files in album.files) {
      if (files.isImage) listofalbums.add(files);
    }
  }

  return listofalbums;
}

class ReviewImage extends StatelessWidget {
  ReviewImage({super.key, required this.file, this.stream});
  File? file;
  StreamController<File?>? stream;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Expanded(
              child: Container(
            child: Center(
              child: Image.file(file!),
            ),
          )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      stream!.add(file);
                      GoRouter.of(context).pop();
                      GoRouter.of(context).pop();
                    },
                    child: Text(
                      "done",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
                TextButton(
                    onPressed: () {
                      stream!.add(null);
                      GoRouter.of(context).pop();
                    },
                    child: Text(
                      "No",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
