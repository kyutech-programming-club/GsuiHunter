import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/quest.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestModel extends ChangeNotifier {
  List<Quest> questList = [];

  void fetchQuest() async {
    final QuerySnapshot questSnapshots = await FirebaseFirestore.instance.collection('quests').get();
    final questList = questSnapshots.docs.map((doc) => Quest(doc)).toList();
    this.questList = questList;
    notifyListeners();
  }
}
