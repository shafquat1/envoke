import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SharedUserRecord extends FirestoreRecord {
  SharedUserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "isShared" field.
  bool? _isShared;
  bool get isShared => _isShared ?? false;
  bool hasIsShared() => _isShared != null;

  // "sharedEmail" field.
  String? _sharedEmail;
  String get sharedEmail => _sharedEmail ?? '';
  bool hasSharedEmail() => _sharedEmail != null;

  // "sharedUid" field.
  String? _sharedUid;
  String get sharedUid => _sharedUid ?? '';
  bool hasSharedUid() => _sharedUid != null;

  // "sharedUserName" field.
  String? _sharedUserName;
  String get sharedUserName => _sharedUserName ?? '';
  bool hasSharedUserName() => _sharedUserName != null;

  void _initializeFields() {
    _isShared = snapshotData['isShared'] as bool?;
    _sharedEmail = snapshotData['sharedEmail'] as String?;
    _sharedUid = snapshotData['sharedUid'] as String?;
    _sharedUserName = snapshotData['sharedUserName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sharedUser');

  static Stream<SharedUserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SharedUserRecord.fromSnapshot(s));

  static Future<SharedUserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SharedUserRecord.fromSnapshot(s));

  static SharedUserRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SharedUserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SharedUserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SharedUserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SharedUserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SharedUserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSharedUserRecordData({
  bool? isShared,
  String? sharedEmail,
  String? sharedUid,
  String? sharedUserName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isShared': isShared,
      'sharedEmail': sharedEmail,
      'sharedUid': sharedUid,
      'sharedUserName': sharedUserName,
    }.withoutNulls,
  );

  return firestoreData;
}

class SharedUserRecordDocumentEquality implements Equality<SharedUserRecord> {
  const SharedUserRecordDocumentEquality();

  @override
  bool equals(SharedUserRecord? e1, SharedUserRecord? e2) {
    return e1?.isShared == e2?.isShared &&
        e1?.sharedEmail == e2?.sharedEmail &&
        e1?.sharedUid == e2?.sharedUid &&
        e1?.sharedUserName == e2?.sharedUserName;
  }

  @override
  int hash(SharedUserRecord? e) => const ListEquality()
      .hash([e?.isShared, e?.sharedEmail, e?.sharedUid, e?.sharedUserName]);

  @override
  bool isValidKey(Object? o) => o is SharedUserRecord;
}
