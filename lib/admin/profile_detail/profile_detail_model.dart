import '/flutter_flow/flutter_flow_util.dart';
import 'profile_detail_widget.dart' show ProfileDetailWidget;
import 'package:flutter/material.dart';

class ProfileDetailModel extends FlutterFlowModel<ProfileDetailWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
