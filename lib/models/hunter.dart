import 'package:cloud_firestore/cloud_firestore.dart';

class Hunter{
  Hunter(DocumentSnapshot doc){
    this.id = doc.id;
    this.name = doc.data()['name'];
    this.rank = doc.data()['rank'];
    this.exp = doc.data()['exp'];
    this.currentQuest = doc.data()['currentQuest'];
    this.quests = doc.data()['quests'];
    this.skills = doc.data()['skills'];
  }
  String id;
  String name;
  int rank;
  int exp;
  DocumentReference currentQuest;
  List<dynamic> quests;
  Map<String, dynamic> skills;
}
