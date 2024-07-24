import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'memories_timeline_widget.dart' show MemoriesTimelineWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoriesTimelineModel extends FlutterFlowModel<MemoriesTimelineWidget> {
  ///  Local state fields for this page.

  List<MemoriesRecord> listMemories = [];
  void addToListMemories(MemoriesRecord item) => listMemories.add(item);
  void removeFromListMemories(MemoriesRecord item) => listMemories.remove(item);
  void removeAtIndexFromListMemories(int index) => listMemories.removeAt(index);
  void insertAtIndexInListMemories(int index, MemoriesRecord item) =>
      listMemories.insert(index, item);
  void updateListMemoriesAtIndex(
          int index, Function(MemoriesRecord) updateFn) =>
      listMemories[index] = updateFn(listMemories[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in MemoriesTimeline widget.
  List<MemoriesRecord>? output;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
