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
  NfcManager.instance.startSession(onDiscovered: (NfcTag badge) async {
    var ndef = Ndef.from(badge);

    if (ndef != null && ndef.isWritable) {
      NdefRecord ndefRecord = NdefRecord.createText(userId);
      NdefMessage message = NdefMessage([ndefRecord]);

      try {
        await ndef.write(message);
      } catch (e) {
        NfcManager.instance
            .stopSession(errorMessage: "Error while writing to badge");
      }
    }

    NfcManager.instance.stopSession();
  });
}
// Future<void> writeNfcTag(String? userId) async {
//   NFCAvailability availability;

//   availability = await FlutterNfcKit.nfcAvailability;

//   try {
//     // Poll for the NFC tag
//     NFCTag tag = await FlutterNfcKit.poll();

//     if (tag.ndefWritable!) {
//       await FlutterNfcKit.writeNDEFRecords([new ndef.TextRecord(text: userId)]);
//     }
//   } catch (e) {
//     print('Error scanning NFC tag: $e');
//   }
// }
