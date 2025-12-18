import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskRecord extends FirestoreRecord {
  TaskRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Lane" field.
  int? _lane;
  int get lane => _lane ?? 0;
  bool hasLane() => _lane != null;

  // "DateTimeDragged" field.
  DateTime? _dateTimeDragged;
  DateTime? get dateTimeDragged => _dateTimeDragged;
  bool hasDateTimeDragged() => _dateTimeDragged != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "AssignedTo" field.
  String? _assignedTo;
  String get assignedTo => _assignedTo ?? '';
  bool hasAssignedTo() => _assignedTo != null;

  // "Client" field.
  String? _client;
  String get client => _client ?? '';
  bool hasClient() => _client != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _lane = castToType<int>(snapshotData['Lane']);
    _dateTimeDragged = snapshotData['DateTimeDragged'] as DateTime?;
    _description = snapshotData['Description'] as String?;
    _assignedTo = snapshotData['AssignedTo'] as String?;
    _client = snapshotData['Client'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Task');

  static Stream<TaskRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TaskRecord.fromSnapshot(s));

  static Future<TaskRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TaskRecord.fromSnapshot(s));

  static TaskRecord fromSnapshot(DocumentSnapshot snapshot) => TaskRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TaskRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TaskRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TaskRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TaskRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTaskRecordData({
  String? title,
  int? lane,
  DateTime? dateTimeDragged,
  String? description,
  String? assignedTo,
  String? client,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Lane': lane,
      'DateTimeDragged': dateTimeDragged,
      'Description': description,
      'AssignedTo': assignedTo,
      'Client': client,
    }.withoutNulls,
  );

  return firestoreData;
}

class TaskRecordDocumentEquality implements Equality<TaskRecord> {
  const TaskRecordDocumentEquality();

  @override
  bool equals(TaskRecord? e1, TaskRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.lane == e2?.lane &&
        e1?.dateTimeDragged == e2?.dateTimeDragged &&
        e1?.description == e2?.description &&
        e1?.assignedTo == e2?.assignedTo &&
        e1?.client == e2?.client;
  }

  @override
  int hash(TaskRecord? e) => const ListEquality().hash([
        e?.title,
        e?.lane,
        e?.dateTimeDragged,
        e?.description,
        e?.assignedTo,
        e?.client
      ]);

  @override
  bool isValidKey(Object? o) => o is TaskRecord;
}
