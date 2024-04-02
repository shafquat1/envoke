import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/nfc_scan_tag/nfc_scan_tag_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'nfc_scan_tag_widget.dart' show NfcScanTagWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NfcScanTagModel extends FlutterFlowModel<NfcScanTagWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in nfcScanTag widget.
  NfcDataRecord? output;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
