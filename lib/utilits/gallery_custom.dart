import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/reviewand_addcoment_tofile.dart';
import 'package:sophia_chat/featurs/chat/chats_screen/data/models/user_model.dart';

// ignore: must_be_immutable
class CustomGalleryView extends StatefulWidget {
  CustomGalleryView(
      {super.key,
      required this.id,
      required this.usermodel,
      required this.collectionname,
      required this.feildname});
  UserModel usermodel;
  String id;
  String collectionname;
  String feildname;
  @override
  State<CustomGalleryView> createState() => _DraggableScrollViewCustomState();
}

class _DraggableScrollViewCustomState extends State<CustomGalleryView> {
  DraggableScrollableController? control;
  double position = .5;
  List<int> selected = [];
  StreamController<int>? streamController;
  List<File>? listofselecteditem;
  StreamController<int>? streamControllerofselecteditem;

  @override
  void initState() {
    listofselecteditem = [];
    streamController = StreamController<int>();
    streamControllerofselecteditem = StreamController<int>();
    selected = [];

    control = DraggableScrollableController();
    control!.addListener(() {
      if (control!.pixels > MediaQuery.of(context).size.height / 2) {
        setState(() {
          position = 1;
          control!.jumpTo(1);
        });
      }
    });
    id = widget.id;
    super.initState();
  }

  String? id;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        controller: control,
        //expand: true,
        initialChildSize: position,
        maxChildSize: 1,
        minChildSize: .25,
        builder: (c, cc) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(position == 1.0 ? 0 : 40),
                topRight: Radius.circular(position == 1.0 ? 0 : 40)),
            child: Scaffold(
              backgroundColor: Color.fromARGB(255, 252, 251, 251),
              body: SingleChildScrollView(
                controller: cc,
                child: FutureBuilder<List<MediaFile>>(
                    initialData: null,
                    future: getalbums(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return customloadingwidget(
                            context, widget.collectionname, widget.feildname);
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: StreamBuilder(
                                initialData: 1,
                                stream: streamController!.stream,
                                builder: (context, snapshot2) {
                                  return ListView.builder(
                                    itemCount:
                                        (snapshot.data!.length / 5).ceil(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index % 2 == 0) {
                                        return rowItemofGalleryleft(
                                            id: id!,
                                            index: index,
                                            data: snapshot.data,
                                            collectionname:
                                                widget.collectionname,
                                            feildname: widget.feildname);
                                      } else {
                                        return rowItemofGalleryrifht(
                                            id: id!,
                                            index: index,
                                            data: snapshot.data,
                                            collectionname:
                                                widget.collectionname,
                                            feildname: widget.feildname);
                                      }
                                    },
                                  );
                                }),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          );
        });
  }

  Widget rowItemofGalleryleft(
      {required int index,
      List<MediaFile>? data,
      required String id,
      required String collectionname,
      required String feildname}) {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
                height: MediaQuery.of(context).size.width / 2.2,
                //width: hh,
                child: AspectRatio(
                    aspectRatio: 1,
                    child: celofgallery(
                        index: (index * 5),
                        data: data,
                        id: id,
                        collectionname: collectionname,
                        feildname: feildname))),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.width / 2.2,
              child: AspectRatio(
                aspectRatio: 1,
                child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data == null
                        ? 4
                        : ((data.length - index * 5) - 1) > 4
                            ? 4
                            : (data.length - index * 5) - 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            crossAxisCount: 2,
                            childAspectRatio: 1),
                    itemBuilder: (context, i) {
                      return celofgallery(
                          index: (index * 5) + i + 1,
                          data: data,
                          id: id,
                          collectionname: collectionname,
                          feildname: feildname);
                    }),
              ))
        ],
      );
    });
  }

  Widget rowItemofGalleryrifht(
      {required int index,
      List<MediaFile>? data,
      required String id,
      required String collectionname,
      required String feildname}) {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: SizedBox(
                height: MediaQuery.of(context).size.width / 2.2,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data == null
                          ? 4
                          : ((data.length - index * 5) - 1) > 4
                              ? 4
                              : (data.length - index * 5) - 1,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 2,
                              crossAxisCount: 2,
                              childAspectRatio: 1),
                      itemBuilder: (context, i) {
                        return celofgallery(
                            index: (index * 5) + i,
                            data: data,
                            id: id,
                            collectionname: collectionname,
                            feildname: feildname);
                      }),
                )),
          ),
          //data[(index * 5) + 4] != null
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: SizedBox(
                height: MediaQuery.of(context).size.width / 2.2,
                child: AspectRatio(
                    aspectRatio: 1,
                    child: celofgallery(
                        index: (index * 5) + 4,
                        data: data,
                        id: id,
                        collectionname: collectionname,
                        feildname: feildname))),
          )
          //  : const SizedBox()
        ],
      );
    });
  }

  Future<List<MediaFile>> getalbums() async {
    //

    // ignore: unused_local_variable
    List<MediaFile>? listofalbums = [];
    GalleryMedia? allmedia = await GalleryPicker.collectGallery();

    for (var album in allmedia!.albums) {
      print(album.name);
      for (var files in album.files) {
        if (files.isImage) listofalbums.add(files);
      }
    }

    return listofalbums;
  }

  Widget celofgallery(
      {List<MediaFile>? data,
      required int index,
      required String id,
      required String collectionname,
      required String feildname}) {
    return FutureBuilder<File?>(
        initialData: null,
        future: data == null ? null : data[index].getFile(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 247, 245, 245),
                borderRadius: BorderRadius.circular(5),
              ),
            );
          } else {
            if (data![index].isImage) {
              return StatefulBuilder(builder: (context, setstate) {
                return InkWell(
                  onTap: () {
                    setstate(() {
                      if (listofselecteditem!.isEmpty) {
                        streamControllerofselecteditem!.close();
                        streamControllerofselecteditem = StreamController();
                        selecteditem(context, id, widget.usermodel,
                            collectionname, feildname);
                      }
                      if (selected.contains(index)) {
                        listofselecteditem!.removeAt(selected.indexOf(index));
                        selected.remove(index);
                      } else {
                        selected.add(index);
                        listofselecteditem!.add(snapshot.data!);
                      }
                      // stream = Stream.value(selected.indexOf(element));
                      // streamController!.add(selected.length);
                      streamController!.add(selected.length);
                      if (selected.isEmpty) {
                        Scaffold.of(context).context.pop();
                      }
                      streamControllerofselecteditem!.add(selected.length);
                    });
                  },
                  child: Container(
                    //height: MediaQuery.of(context).size.height / 12,
                    decoration: BoxDecoration(
                      // border: selected.contains(index) == true
                      //     ? Border.all(color: ColorApp.primarycolor, width: 2)
                      //     : null,
                      image: DecorationImage(
                          opacity: selected.contains(index) == true ? .6 : 1,
                          fit: BoxFit.cover,
                          image: FileImage(snapshot.data!)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: selected.contains(index) == true
                        ? Stack(children: [
                            Positioned(
                              right: 1,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: ColorApp.primarycolor,
                                child: Center(
                                    child:

                                        //print("snap shot runnn ${snapshat.data}");
                                        Text(
                                  (selected.indexOf(index) + 1).toString(),
                                  style: TextStyleConst.textstyle15,
                                )),
                              ),
                            )
                          ])
                        : null,
                  ),
                );
              });
            } else {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text("video"),
                ),
              );
            }
          }
        });
  }

  customloadingwidget(context, collectionname, feildname) {
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
                      color: ColorApp.primarycolor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                if (index % 2 == 0) {
                  return rowItemofGalleryleft(
                      index: index,
                      data: null,
                      id: '',
                      collectionname: collectionname,
                      feildname: feildname);
                } else {
                  return rowItemofGalleryrifht(
                      collectionname: collectionname,
                      feildname: feildname,
                      index: index,
                      data: null,
                      id: '');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  selecteditem(context, id, usermodel, collectionname, feildname) {
    showBottomSheet(
      backgroundColor: ColorApp.primarycolor6,
      //  isDismissible: true,
      //elevation: 1,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (context) {
        return PopScope(
          onPopInvoked: (pop) {
            listofselecteditem!.clear();
            listofselecteditem = [];
            selected = [];
            setState(() {});
          },
          child: StreamBuilder<int>(
              stream: streamControllerofselecteditem!.stream,
              initialData: 0,
              builder: (context, snapshot) {
                return SizedBox(
                    height: 65,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (c) {
                                return reviewandaddcoment(
                                  image: listofselecteditem,
                                  type: "image",
                                  id: id,
                                  usermodel: usermodel,
                                  collectionname: collectionname,
                                  feildname: feildname,
                                );
                              }));
                            },
                            child: CircleAvatar(
                                radius: 28,
                                backgroundColor: ColorApp.greycolor,
                                child: Icon(
                                  Icons.done,
                                  size: 30,
                                  color: ColorApp.primarycolor,
                                ))),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          width: MediaQuery.of(context).size.width - 60,
                          child: ListView.builder(
                            //  reverse: true,
                            itemCount: listofselecteditem!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(listofselecteditem![
                                              (listofselecteditem!.length - 1) -
                                                  index])),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 60,
                                  width: 60,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ));
              }),
        );
      },
      context: context,
    );
  }
}
