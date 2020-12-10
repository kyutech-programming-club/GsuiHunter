import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/quest.dart';

class SearchQuestModel extends ChangeNotifier {
  List<Quest> questList = [];

  void searchQuest(String tag) async {
    final QuerySnapshot tagData = await FirebaseFirestore.instance
        .collection('tags')
        .where('name', isEqualTo: tag)
        .limit(1)
        .get();
    final List<dynamic> questRefs = tagData.docs[0].data()['quests'];
    final questList = [];
    await Future.forEach(
      questRefs, (questRef) async {
        final questSnapshot = await questRef.get();
        questList.add(Quest(questSnapshot));
    },);
    this.questList = List<Quest>.from(questList);
    notifyListeners();
  }
}
