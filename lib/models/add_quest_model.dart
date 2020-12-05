import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddQuestModel extends ChangeNotifier{
  String questName;
  String groupValue = '0';
  final List<String> questRank = ['1', '2', '3', '4', '5',];

  void changeQuestName(String questName) {
    this.questName = questName;
  }

  Future add() async{
    final collection = FirebaseFirestore.instance.collection("questList");
    await collection.add({
      'quest_name': this.questName,
    });
  }
}