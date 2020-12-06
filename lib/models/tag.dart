import 'package:cloud_firestore/cloud_firestore.dart';

class Tag {
  Tag(DocumentSnapshot doc) {
    this.name = doc.data()['name'];
    this.quests = doc.data()['quests'] ?? null;
  }

  String name;
  List<dynamic> quests;
}
