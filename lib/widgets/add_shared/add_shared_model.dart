import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_shared_widget.dart' show AddSharedWidget;
import 'package:flutter/material.dart';

class AddSharedModel extends FlutterFlowModel<AddSharedWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? output;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
