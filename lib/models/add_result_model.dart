import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter.dart';
import 'package:g_sui_hunter/models/quest.dart';

class AddResultModel extends ChangeNotifier {
  Hunter hunter;
  Quest currentQuest;

  Future clearQuest() async {
    final hunterRef = FirebaseFirestore.instance.collection('hunters').doc(hunter.id);
    final hunterData = await hunterRef.get();

    final currentQuestRef = hunterData.data()['currentQuest'];
    final currentQuestData = await currentQuestRef.get();

    hunterRef.update({
      'currentQuest': null,
      'quests': FieldValue.arrayUnion([currentQuestRef]),
      'exp': FieldValue.increment(currentQuestData.data()['rank']*10)
    });
    hunter.currentQuest = null;
    notifyListeners();
  }

  Future createState(Hunter hunter) async {
    this.hunter = hunter;

    final questSnapshot = await hunter.currentQuest.get();
    this.currentQuest = Quest(questSnapshot);

    notifyListeners();
  }

}
