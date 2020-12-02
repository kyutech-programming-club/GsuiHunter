import 'package:cloud_firestore/cloud_firestore.dart';

class Hunter{
  Hunter(DocumentSnapshot doc){
    this.currentQuest = doc.data()["currentQuest"];
    this.exp = doc.data()["exp"];
    this.name = doc.data()["name"];
    this.quests = doc.data()["quests"];
    this.rank = doc.data()["rank"];
    this.skills = doc.data()["skills"];
  }
  String name;
  Map<String, int> skills;
  int exp;
  int rank;
  List<DocumentReference> quests;
  DocumentReference currentQuest;
}
