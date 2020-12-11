import 'package:cloud_firestore/cloud_firestore.dart';

class Hunter{
  Hunter(DocumentSnapshot doc){
    this.id = doc.id;
    this.name = doc.data()['name'];
    this.photoUrl = doc.data()['photoUrl'];
    this.rank = doc.data()['rank'];
    this.exp = doc.data()['exp'];
    this.followee = doc.data()['followee'];
    this.currentQuest = doc.data()['currentQuest'];
    this.quests = doc.data()['quests'];
    this.skills = doc.data()['skills'];
  }
  String id;
  String name;
  String photoUrl;
  int rank;
  int exp;
  List<dynamic> followee;
  DocumentReference currentQuest;
  List<dynamic> quests;
  Map<String, dynamic> skills;
}
