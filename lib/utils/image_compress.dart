import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<File> compressImage(File file) async {
  var result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    file.absolute.path,
    quality: 90,
  );

  return result!;
}
