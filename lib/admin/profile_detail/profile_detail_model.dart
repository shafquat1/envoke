import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_detail_widget.dart' show ProfileDetailWidget;
import 'package:flutter/material.dart';

class ProfileDetailModel extends FlutterFlowModel<ProfileDetailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? output;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SharedUserRecord? output2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
