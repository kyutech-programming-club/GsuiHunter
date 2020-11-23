import 'package:flutter/material.dart';
import 'package:g_sui_hunter/quest.dart';

class QuestModel extends ChangeNotifier {
  List<Quest> questList = [];

  void getQuest(){
    Map<String, Object> questData = {
      'name': '麻婆豆腐',
      'time': 5,
      'diff': 2,
      'pictureUrl': 'https://img.cpcdn.com/recipes/1729093/640x640c0_52_320_320_320/01766adbf40769623d5b4b8b4bdb9df0.jpg'
    };
    Quest quest = Quest(questData);
    this.questList = [quest, quest, quest, quest];
    notifyListeners();
  }
}
