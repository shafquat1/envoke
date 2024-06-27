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

import 'package:path/path.dart' as p;

import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<String> imgCompressSPBupload(FFUploadedFile file) async {
  Uint8List bytess = file.bytes!;

  // converts uint8LIst? to uint8List

  var result = await FlutterImageCompress.compressWithList(
    bytess,
    quality: 90,
  );

// Get the temporary directory
  final tempDir = await getTemporaryDirectory();
  final tempPath = tempDir.path;

  // Create a unique file name
  final fileName =
      'compressed_image_${DateTime.now().millisecondsSinceEpoch}.jpg';

  // Write the compressed bytes to a file
  final compressedFile = File(p.join(tempPath, fileName));
  await compressedFile.writeAsBytes(result);

  // Return the file path
  return compressedFile.path;
}
