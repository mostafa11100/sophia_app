import 'dart:ui';

import 'package:gallery_picker/gallery_picker.dart';
import 'package:gallery_picker/models/gallery_media.dart';

Future<List<MediaFile>?> gallerypick(context) async {
  List<MediaFile>? selectedMedias = [];
  return
      // GalleryMedia? allmedia = await GalleryPicker.collectGallery(
      //     locale: const Locale('en'));
      // print(allmedia!.albums[0].count);
      await GalleryPicker.pickMedia(
          context: context,
          initSelectedMedia: selectedMedias,
          extraRecentMedia: selectedMedias,
          startWithRecent: true);

  // print(media![0].file);
  // // // GalleryMedia? allmedia = await GalleryPicker.collectGallery();
  //   List<MediaFile>? singleMedia =
  // List<MediaFile>? media =
  //     await GalleryPicker.pickMedia(context: context);
  // // await GalleryPicker.pickMedia(
  // //     context: context, singleMedia: true);
}
