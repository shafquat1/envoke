import '/flutter_flow/flutter_flow_util.dart';
import 'memories_timeline_widget.dart' show MemoriesTimelineWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoriesTimelineModel extends FlutterFlowModel<MemoriesTimelineWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
