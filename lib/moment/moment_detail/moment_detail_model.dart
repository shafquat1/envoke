import '/flutter_flow/flutter_flow_util.dart';
import 'moment_detail_widget.dart' show MomentDetailWidget;
import 'package:flutter/material.dart';

class MomentDetailModel extends FlutterFlowModel<MomentDetailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
