// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

Future<void> nfcScan() async {
  // Add your function code here!

  var appState = FFAppState();

  NFCAvailability availability;

  availability = await FlutterNfcKit.nfcAvailability;

  try {
    // Poll for the NFC tag
    NFCTag tag = await FlutterNfcKit.poll();
    updateNfcTagInAppState(appState, tag);
  } catch (e) {
    print('Error scanning NFC tag: $e');
  }
}

void updateNfcTagInAppState(FFAppState appState, NFCTag? tag) {
  if (tag == null) {
    print('No NFC tag scanned.');
    return;
  }
  // Get the ID of the scanned NFC tag
  var currentTagId = tag.id;
  // Update the app state with the scanned NFC tag ID
  appState.update(() {
    appState.nfcTag = currentTagId;
  });
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
