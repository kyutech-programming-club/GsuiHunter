import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/tag.dart';

class AddQuestModel extends ChangeNotifier {
  String questName;
  String groupValue = '0';
  final List<String> questRank = ['1', '2', '3', '4', '5',];
  Map<String, bool> checkBoxState = {};
  Set<String> _tags = {};

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
    });
    notifyListeners();
  }

  void choiceTag(String tagName, bool checkState) {
    if (checkState == true) {
      _tags.add(tagName);
    }else{
      _tags.remove(tagName);
    }
    this.checkBoxState[tagName] = checkState;
    notifyListeners();
  }

  Future add() async {
    final collection = FirebaseFirestore.instance.collection("quests");
    await collection.add({
      'title': this.questName,
      'siteUrl': '',
      'imageUrl': '',
      'rank': int.parse(this.groupValue),
      'timeAve': 0,
      'tags': _tags.toList(),
    });
  }
}
