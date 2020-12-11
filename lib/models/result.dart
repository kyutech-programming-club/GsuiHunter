import 'package:cloud_firestore/cloud_firestore.dart';

class Result {
  Result(DocumentSnapshot doc) {
    this.id = doc.id;
    this.hunterRef = doc.data()['hunterRef'];
    this.questRef = doc.data()['questRef'];
    this.time = doc.data()['time'];
    this.comment = doc.data()['comment'];
    this.clearedAt = doc.data()['clearedAt'].toDate();

  }

  String id;
  DocumentReference hunterRef;
  DocumentReference questRef;
  int time;
  String comment;
  DateTime clearedAt;
}
