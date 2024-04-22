// // ignore_for_file: non_constant_identifier_names

// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:gallery_picker/gallery_picker.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sophia_chat/const/color_app.dart';
// import 'package:sophia_chat/const/text_style_const.dart';
// import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/reviewand_addcoment_tofile.dart';

// class GalleryCustom {
//     List<int> selected = [];
//      StreamController<int>? streamController;
//      List<File>? listofselecteditem;
//      StreamController<int>? streamControllerofselecteditem;
//     Widget custom_gallery({required String id}) {
//     // DraggableScrollableController control;
//     // control = DraggableScrollableController();
//     // control!.addListener(() {
//     //   if (control!.pixels > MediaQuery.of(context).size.height / 2) {
//     //     GoRouter.of(context).pop();
//     //     //GoRouter.of(context).push(approuter.profilefriend);
//     //   }
//     // });
//     listofselecteditem = [];
//     streamController = StreamController<int>();
//     streamControllerofselecteditem = StreamController<int>();
//     selected = [];

//     return ClipRRect(
//       borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(40), topRight:  Radius.circular(40)),
//       child: Scaffold(
//         body: FutureBuilder<List<MediaFile>>(
//             initialData: null,
//             future: getalbums(),
//             builder: (context, snapshot) {
//               if (snapshot.data == null) {
//                 return customloadingwidget(context);
//               }

//               return SingleChildScrollView(
//                 physics: const NeverScrollableScrollPhysics(),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 18.0, vertical: 15),
//                       child: Row(
//                         children: [
//                           Text(
//                             "All Photos",
//                             style: TextStyleConst.textstyle20
//                                 .copyWith(fontWeight: FontWeight.w700),
//                           ),
//                           const Spacer(),
//                           Text(
//                             "open Camera",
//                             style: TextStyleConst.textstyle18.copyWith(
//                                 color: ColorApp.primarycolor,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height,
//                       child: StreamBuilder(
//                           initialData: 1,
//                           stream: streamController!.stream,
//                           builder: (context, snapshot2) {
//                             return ListView.builder(
//                               itemCount: (snapshot.data!.length / 5).ceil(),
//                               itemBuilder: (BuildContext context, int index) {
//                                 if (index % 2 == 0) {
//                                   return rowItemofGalleryleft(
//                                       id: id,
//                                       index: index,
//                                       data: snapshot.data);
//                                 } else {
//                                   return rowItemofGalleryrifht(
//                                       id: id,
//                                       index: index,
//                                       data: snapshot.data);
//                                 }
//                               },
//                             );
//                           }),
//                     ),
//                   ],
//                 ),
//               );
//             }),
//       ),
//     );
//   }

//      Widget rowItemofGalleryleft(
//       {required int index, List<MediaFile>? data, required String id}) {
//     return Builder(builder: (context) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(2.0),
//             child: SizedBox(
//                 height: MediaQuery.of(context).size.width / 2.2,
//                 //width: hh,
//                 child: AspectRatio(
//                     aspectRatio: 1,
//                     child:
//                         celofgallery(index: (index * 5), data: data, id: id))),
//           ),
//           SizedBox(
//               height: MediaQuery.of(context).size.width / 2.2,
//               child: AspectRatio(
//                 aspectRatio: 1,
//                 child: GridView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: data == null
//                         ? 4
//                         : ((data.length - index * 5) - 1) > 4
//                             ? 4
//                             : (data.length - index * 5) - 1,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisSpacing: 2,
//                             mainAxisSpacing: 2,
//                             crossAxisCount: 2,
//                             childAspectRatio: 1),
//                     itemBuilder: (context, i) {
//                       return celofgallery(
//                           index: (index * 5) + i + 1, data: data, id: id);
//                     }),
//               ))
//         ],
//       );
//     });
//   }

//     Widget rowItemofGalleryrifht(
//       {required int index, List<MediaFile>? data, required String id}) {
//     return Builder(builder: (context) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 2.0),
//             child: SizedBox(
//                 height: MediaQuery.of(context).size.width / 2.2,
//                 child: AspectRatio(
//                   aspectRatio: 1,
//                   child: GridView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: data == null
//                           ? 4
//                           : ((data.length - index * 5) - 1) > 4
//                               ? 4
//                               : (data.length - index * 5) - 1,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisSpacing: 2,
//                               mainAxisSpacing: 2,
//                               crossAxisCount: 2,
//                               childAspectRatio: 1),
//                       itemBuilder: (context, i) {
//                         return celofgallery(
//                             index: (index * 5) + i, data: data, id: id);
//                       }),
//                 )),
//           ),
//           //data[(index * 5) + 4] != null
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 2.0),
//             child: SizedBox(
//                 height: MediaQuery.of(context).size.width / 2.2,
//                 child: AspectRatio(
//                     aspectRatio: 1,
//                     child: celofgallery(
//                         index: (index * 5) + 4, data: data, id: id))),
//           )
//           //  : const SizedBox()
//         ],
//       );
//     });
//   }

//     Future<List<MediaFile>> getalbums() async {
//     //

//     // ignore: unused_local_variable
//     List<MediaFile>? listofalbums = [];
//     GalleryMedia? allmedia =
//         await GalleryPicker.collectGallery(locale: const Locale("tr"));

//     for (var album in allmedia!.albums) {
//       for (var files in album.files) {
//         listofalbums.add(files);
//       }
//     }

//     return listofalbums;
//   }

//      Widget celofgallery(
//       {List<MediaFile>? data, required int index, required String id}) {
//     return FutureBuilder<File?>(
//         initialData: null,
//         future: data == null ? null : data[index].getFile(),
//         builder: (context, snapshot) {
//           if (snapshot.data == null) {
//             return Container(
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 219, 217, 217),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//             );
//           } else {
//             if (data![index].isImage) {
//               return StatefulBuilder(builder: (context, setstate) {
//                 return InkWell(
//                   onTap: () {
//                     setstate(() {
//                       if (listofselecteditem!.isEmpty) {
//                         streamControllerofselecteditem!.close();
//                         streamControllerofselecteditem = StreamController();
//                         selecteditem(context, id);
//                       }
//                       if (selected.contains(index)) {
//                         listofselecteditem!.removeAt(selected.indexOf(index));
//                         selected.remove(index);
//                       } else {
//                         selected.add(index);
//                         listofselecteditem!.add(snapshot.data!);
//                       }
//                       // stream = Stream.value(selected.indexOf(element));
//                       // streamController!.add(selected.length);
//                       streamController!.add(selected.length);
//                       if (selected.isEmpty) {
//                         Scaffold.of(context).context.pop();
//                       }
//                       streamControllerofselecteditem!.add(selected.length);
//                     });
//                   },
//                   child: Container(
//                     //height: MediaQuery.of(context).size.height / 12,
//                     decoration: BoxDecoration(
//                       // border: selected.contains(index) == true
//                       //     ? Border.all(color: ColorApp.primarycolor, width: 2)
//                       //     : null,
//                       image: DecorationImage(
//                           opacity: selected.contains(index) == true ? .6 : 1,
//                           fit: BoxFit.cover,
//                           image: FileImage(snapshot.data!)),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: selected.contains(index) == true
//                         ? Stack(children: [
//                             Positioned(
//                               right: 1,
//                               child: CircleAvatar(
//                                 radius: 15,
//                                 backgroundColor: ColorApp.primarycolor,
//                                 child: Center(
//                                     child:

//                                         //print("snap shot runnn ${snapshat.data}");
//                                         Text(
//                                   (selected.indexOf(index) + 1).toString(),
//                                   style: TextStyleConst.textstyle15,
//                                 )),
//                               ),
//                             )
//                           ])
//                         : null,
//                   ),
//                 );
//               });
//             } else {
//               return Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: const Center(
//                   child: Text("video"),
//                 ),
//               );
//             }
//           }
//         });
//   }

//      customloadingwidget(context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
//             child: Row(
//               children: [
//                 Text(
//                   "All Photos",
//                   style: TextStyleConst.textstyle20
//                       .copyWith(fontWeight: FontWeight.w700),
//                 ),
//                 const Spacer(),
//                 Text(
//                   "open Camera",
//                   style: TextStyleConst.textstyle18.copyWith(
//                       color: ColorApp.primarycolor,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height,
//             child: ListView.builder(
//               itemCount: 100,
//               itemBuilder: (BuildContext context, int index) {
//                 if (index % 2 == 0) {
//                   return rowItemofGalleryleft(index: index, data: null, id: '');
//                 } else {
//                   return rowItemofGalleryrifht(
//                       index: index, data: null, id: '');
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//       selecteditem(context, id) {
//     showBottomSheet(
//         backgroundColor: ColorApp.primarycolor4,
//         //  isDismissible: true,
//         //elevation: 1,
//         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//         builder: (context) {
//           return StreamBuilder<int>(
//               stream: streamControllerofselecteditem!.stream,
//               initialData: 0,
//               builder: (context, snapshot) {
//                 return SizedBox(
//                     height: 65,
//                     width: MediaQuery.of(context).size.width,
//                     child: Row(
//                       children: [
//                         InkWell(
//                             onTap: () {
//                               Navigator.of(context)
//                                   .push(MaterialPageRoute(builder: (c) {
//                                 return reviewandaddcoment(
//                                     image: listofselecteditem,
//                                     type: "image",
//                                     id: id);
//                               }));
//                             },
//                             child: CircleAvatar(
//                                 radius: 28,
//                                 backgroundColor: ColorApp.greycolor,
//                                 child: Icon(
//                                   Icons.done,
//                                   size: 30,
//                                   color: ColorApp.primarycolor,
//                                 ))),
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 2),
//                           width: MediaQuery.of(context).size.width - 60,
//                           child: ListView.builder(
//                             //  reverse: true,
//                             itemCount: listofselecteditem!.length,
//                             scrollDirection: Axis.horizontal,
//                             itemBuilder: (BuildContext context, int index) {
//                               return Padding(
//                                 padding: const EdgeInsets.all(1.0),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                           fit: BoxFit.cover,
//                                           image: FileImage(listofselecteditem![
//                                               (listofselecteditem!.length - 1) -
//                                                   index])),
//                                       borderRadius: BorderRadius.circular(10)),
//                                   height: 60,
//                                   width: 60,
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ));
//               });
//         },
//         context: context);
//   }
// }

// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:sophia_chat/const/color_app.dart';
import 'package:sophia_chat/const/text_style_const.dart';
import 'package:sophia_chat/featurs/chat/chat_screen/view/ui/chat_screen_widget/reviewand_addcoment_tofile.dart';

// ignore: must_be_immutable
class CustomGalleryView extends StatefulWidget {
  CustomGalleryView({super.key, required this.id});

  String id;
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
              backgroundColor: Color.fromARGB(255, 230, 227, 227),
              body: SingleChildScrollView(
                controller: cc,
                child: FutureBuilder<List<MediaFile>>(
                    initialData: null,
                    future: getalbums(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return customloadingwidget(context);
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
                                            data: snapshot.data);
                                      } else {
                                        return rowItemofGalleryrifht(
                                            id: id!,
                                            index: index,
                                            data: snapshot.data);
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
      {required int index, List<MediaFile>? data, required String id}) {
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
                    child:
                        celofgallery(index: (index * 5), data: data, id: id))),
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
                          index: (index * 5) + i + 1, data: data, id: id);
                    }),
              ))
        ],
      );
    });
  }

  Widget rowItemofGalleryrifht(
      {required int index, List<MediaFile>? data, required String id}) {
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
                            index: (index * 5) + i, data: data, id: id);
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
                        index: (index * 5) + 4, data: data, id: id))),
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
    GalleryMedia? allmedia =
        await GalleryPicker.collectGallery(locale: const Locale("tr"));

    for (var album in allmedia!.albums) {
      for (var files in album.files) {
        listofalbums.add(files);
      }
    }

    return listofalbums;
  }

  Widget celofgallery(
      {List<MediaFile>? data, required int index, required String id}) {
    return FutureBuilder<File?>(
        initialData: null,
        future: data == null ? null : data[index].getFile(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 219, 217, 217),
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
                        selecteditem(context, id);
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

  customloadingwidget(context) {
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
                  return rowItemofGalleryleft(index: index, data: null, id: '');
                } else {
                  return rowItemofGalleryrifht(
                      index: index, data: null, id: '');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  selecteditem(context, id) {
    showBottomSheet(
      backgroundColor: ColorApp.primarycolor4,
      //  isDismissible: true,
      //elevation: 1,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (context) {
        return StreamBuilder<int>(
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
                                  id: id);
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
            });
      },
      context: context,
    );
  }
}
