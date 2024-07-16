import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_shared_widget.dart' show AddSharedWidget;
import 'package:flutter/material.dart';

class AddSharedModel extends FlutterFlowModel<AddSharedWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8be8x666' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? output;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SharedUserRecord? output2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? output3;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
