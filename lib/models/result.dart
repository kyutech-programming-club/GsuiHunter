import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:g_sui_hunter/models/hunter.dart';
import 'package:g_sui_hunter/models/quest.dart';

class Result {
  Result(DocumentSnapshot doc, Hunter hunter, Quest quest) {
    this.id = doc.id;
    this.hunter = hunter;
    this.quest = quest;
    this.resultImageUrl = doc.data()['resultImageUrl'];
    this.time = doc.data()['time'];
    this.comment = doc.data()['comment'];
    this.clearedAt = doc.data()['clearedAt'].toDate();

  }

  String id;
  Hunter hunter;
  Quest quest;
  String resultImageUrl;
  int time;
  String comment;
  DateTime clearedAt;
}
