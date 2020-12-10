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
    Future.forEach(
      questRefs, (questRef) async {
        this.questList.add(Quest(await questRef.get()));
    },);
    notifyListeners();
  }
}
