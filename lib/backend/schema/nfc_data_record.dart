import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NfcDataRecord extends FirestoreRecord {
  NfcDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nfcId" field.
  String? _nfcId;
  String get nfcId => _nfcId ?? '';
  bool hasNfcId() => _nfcId != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _nfcId = snapshotData['nfcId'] as String?;
    _userId = snapshotData['userId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('nfcData');

  static Stream<NfcDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NfcDataRecord.fromSnapshot(s));

  static Future<NfcDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NfcDataRecord.fromSnapshot(s));

  static NfcDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NfcDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NfcDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NfcDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NfcDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NfcDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNfcDataRecordData({
  String? nfcId,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nfcId': nfcId,
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class NfcDataRecordDocumentEquality implements Equality<NfcDataRecord> {
  const NfcDataRecordDocumentEquality();

  @override
  bool equals(NfcDataRecord? e1, NfcDataRecord? e2) {
    return e1?.nfcId == e2?.nfcId && e1?.userId == e2?.userId;
  }

  @override
  int hash(NfcDataRecord? e) =>
      const ListEquality().hash([e?.nfcId, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is NfcDataRecord;
}
