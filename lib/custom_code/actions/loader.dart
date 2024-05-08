// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../widgets/index.dart';

Future loader() async {
  // Add your function code here!
  await MyCircularProgressIndicator(
    width: 100,
    height: 100,
    size: 100,
    color: Colors.tealAccent,
  );
}
