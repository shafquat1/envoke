// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ndef/ndef.dart' as ndef;

Future<void> writeNfcTag(String? userId) async {
  NFCAvailability availability;

  availability = await FlutterNfcKit.nfcAvailability;

  try {
    // Poll for the NFC tag
    NFCTag tag = await FlutterNfcKit.poll();

    if (tag.ndefWritable!) {
      await FlutterNfcKit.writeNDEFRecords([new ndef.TextRecord(text: userId)]);
    }
  } catch (e) {
    print('Error scanning NFC tag: $e');
  }
}
