// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:path_provider/path_provider.dart';

import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<FFUploadedFile> compress(FFUploadedFile file) async {
  Uint8List bytess = file.bytes!;

  // converts uint8LIst? to uint8List

  var result = await FlutterImageCompress.compressWithList(
    bytess,
    quality: 10,
  );

// you can add more params as per the documentation in the pub.dev package.

//uint8List is bytes.

  return FFUploadedFile(
      name: file.name, bytes: result, blurHash: file.blurHash);
}
