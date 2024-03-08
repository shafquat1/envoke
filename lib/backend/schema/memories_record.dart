import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class MemoriesRecord extends FirestoreRecord {
  MemoriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "memory_title" field.
  String? _memoryTitle;
  String get memoryTitle => _memoryTitle ?? '';
  bool hasMemoryTitle() => _memoryTitle != null;

  // "img_url" field.
  String? _imgUrl;
  String get imgUrl => _imgUrl ?? '';
  bool hasImgUrl() => _imgUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _memoryTitle = snapshotData['memory_title'] as String?;
    _imgUrl = snapshotData['img_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('memories');

  static Stream<MemoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MemoriesRecord.fromSnapshot(s));

  static Future<MemoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MemoriesRecord.fromSnapshot(s));

  static MemoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MemoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MemoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MemoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MemoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MemoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMemoriesRecordData({
  String? userId,
  String? memoryTitle,
  String? imgUrl,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'memory_title': memoryTitle,
      'img_url': imgUrl,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class MemoriesRecordDocumentEquality implements Equality<MemoriesRecord> {
  const MemoriesRecordDocumentEquality();

  @override
  bool equals(MemoriesRecord? e1, MemoriesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.memoryTitle == e2?.memoryTitle &&
        e1?.imgUrl == e2?.imgUrl &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(MemoriesRecord? e) => const ListEquality()
      .hash([e?.userId, e?.memoryTitle, e?.imgUrl, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is MemoriesRecord;
}
