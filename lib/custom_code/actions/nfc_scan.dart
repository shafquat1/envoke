// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:uuid/uuid.dart';

Future<void> nfcScan() async {
  // Add your function code here!

  var appState = FFAppState();

  NFCAvailability availability;

  availability = await FlutterNfcKit.nfcAvailability;

  var uuid = Uuid();

  try {
    // Poll for the NFC tag
    NFCTag tag = await FlutterNfcKit.poll();
    appState.update(() {
      appState.nfcTag = uuid.v4();
    });
    updateNfcTagInAppState(appState, tag);
    readNfcData(appState, tag);
  } catch (e) {
    print('Error scanning NFC tag: $e');
  }
}

Future<void> updateNfcTagInAppState(FFAppState appState, NFCTag? tag) async {
  if (tag == null) {
    print('No NFC tag scanned.');
    return;
  }
  // Get the ID of the scanned NFC tag
  var currentTagId = tag.id;
  // Update the app state with the scanned NFC tag ID
  appState.update(() {
    if (appState.nfcTag.isEmpty) {
      appState.nfcTag = currentTagId;
    }
  });
}

Future<void> readNfcData(FFAppState appState, NFCTag? tag) async {
  if (tag?.ndefAvailable == true) {
    for (var record in await FlutterNfcKit.readNDEFRecords(cached: false)) {
      var payload = record.toString().replaceAll(
          'TextRecord: id=(empty) typeNameFormat=TypeNameFormat.nfcWellKnown type=T encoding=UTF-8 language=en text=',
          '');
      var nfcUserId = payload;
      print(nfcUserId);
      if (nfcUserId.isNotEmpty) {
        appState.update(() {
          appState.nfcUserId = nfcUserId;
        });
      }
    }
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
