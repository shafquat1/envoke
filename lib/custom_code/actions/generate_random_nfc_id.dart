// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:uuid/uuid.dart';

Future generateRandomNfcId() async {
  var appState = FFAppState();
  var uuid = Uuid();

  appState.update(() {
    appState.nfcTag = uuid.v4();
    appState.writeTag = true;
  });
  // Add your function code here!
}
