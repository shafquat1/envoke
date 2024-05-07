import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class SharedUserRecord extends FirestoreRecord {
  SharedUserRecord._(
    super.reference,
    super.data,
  ) {
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

  // "ownUserId" field.
  String? _ownUserId;
  String get ownUserId => _ownUserId ?? '';
  bool hasOwnUserId() => _ownUserId != null;

  // "ownEmail" field.
  String? _ownEmail;
  String get ownEmail => _ownEmail ?? '';
  bool hasOwnEmail() => _ownEmail != null;

  void _initializeFields() {
    _isShared = snapshotData['isShared'] as bool?;
    _sharedEmail = snapshotData['sharedEmail'] as String?;
    _sharedUid = snapshotData['sharedUid'] as String?;
    _sharedUserName = snapshotData['sharedUserName'] as String?;
    _ownUserId = snapshotData['ownUserId'] as String?;
    _ownEmail = snapshotData['ownEmail'] as String?;
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
  String? ownUserId,
  String? ownEmail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isShared': isShared,
      'sharedEmail': sharedEmail,
      'sharedUid': sharedUid,
      'sharedUserName': sharedUserName,
      'ownUserId': ownUserId,
      'ownEmail': ownEmail,
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
        e1?.sharedUserName == e2?.sharedUserName &&
        e1?.ownUserId == e2?.ownUserId &&
        e1?.ownEmail == e2?.ownEmail;
  }

  @override
  int hash(SharedUserRecord? e) => const ListEquality().hash([
        e?.isShared,
        e?.sharedEmail,
        e?.sharedUid,
        e?.sharedUserName,
        e?.ownUserId,
        e?.ownEmail
      ]);

  @override
  bool isValidKey(Object? o) => o is SharedUserRecord;
}
