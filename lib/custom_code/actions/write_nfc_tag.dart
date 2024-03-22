// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'package:ndef/ndef.dart' as ndef;
import 'package:nfc_manager/nfc_manager.dart';

Future<void> writeNfcTag(String userId) async {
  var appState = FFAppState();

  NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
    var ndef = Ndef.from(tag);
    if (ndef == null || !ndef.isWritable) {
      NfcManager.instance.stopSession(errorMessage: 'NO NFC');
      return;
    }

    NdefMessage message = NdefMessage([
      NdefRecord.createText(userId),
    ]);

    try {
      await ndef.write(message);
      NfcManager.instance.stopSession();
      appState.update(() {
        appState.writeTag = true;
      });
    } catch (e) {
      NfcManager.instance.stopSession(errorMessage: 'No NFC');
      return;
    }
  });
}
