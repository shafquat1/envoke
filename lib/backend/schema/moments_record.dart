import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MomentsRecord extends FirestoreRecord {
  MomentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "img_url" field.
  String? _imgUrl;
  String get imgUrl => _imgUrl ?? '';
  bool hasImgUrl() => _imgUrl != null;

  // "audio_url" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  bool hasAudioUrl() => _audioUrl != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _imgUrl = snapshotData['img_url'] as String?;
    _audioUrl = snapshotData['audio_url'] as String?;
    _title = snapshotData['title'] as String?;
    _notes = snapshotData['notes'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('moments')
          : FirebaseFirestore.instance.collectionGroup('moments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('moments').doc(id);

  static Stream<MomentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MomentsRecord.fromSnapshot(s));

  static Future<MomentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MomentsRecord.fromSnapshot(s));

  static MomentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MomentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MomentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MomentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MomentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MomentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMomentsRecordData({
  String? imgUrl,
  String? audioUrl,
  String? title,
  String? notes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'img_url': imgUrl,
      'audio_url': audioUrl,
      'title': title,
      'notes': notes,
    }.withoutNulls,
  );

  return firestoreData;
}

class MomentsRecordDocumentEquality implements Equality<MomentsRecord> {
  const MomentsRecordDocumentEquality();

  @override
  bool equals(MomentsRecord? e1, MomentsRecord? e2) {
    return e1?.imgUrl == e2?.imgUrl &&
        e1?.audioUrl == e2?.audioUrl &&
        e1?.title == e2?.title &&
        e1?.notes == e2?.notes;
  }

  @override
  int hash(MomentsRecord? e) =>
      const ListEquality().hash([e?.imgUrl, e?.audioUrl, e?.title, e?.notes]);

  @override
  bool isValidKey(Object? o) => o is MomentsRecord;
}
