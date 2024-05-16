import '/flutter_flow/flutter_flow_util.dart';
import 'moment_detail_widget.dart' show MomentDetailWidget;
import 'package:flutter/material.dart';

class MomentDetailModel extends FlutterFlowModel<MomentDetailWidget> {
  ///  Local state fields for this page.

  DateTime? createdAt;

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
