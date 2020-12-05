import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/tag.dart';

class AddQuestModel extends ChangeNotifier{
  String questName;
  String groupValue = '0';
  final List<String> questRank = ['1', '2', '3', '4', '5',];
  Map<String, bool> checkBoxState = {};

  void changeQuestName(String questName) {
    this.questName = questName;
  }

  void choiceRank(String value) {
    this.groupValue = value;
    notifyListeners();
  }

  void createCheckBoxState(List<Tag> tagList) {
    tagList.forEach((tag) {
      checkBoxState[tag.name] = false;
      print(tag.name);
    });
  }

  Future add() async{
    final collection = FirebaseFirestore.instance.collection("questList");
    await collection.add({
      'quest_name': this.questName,
    });
  }
}