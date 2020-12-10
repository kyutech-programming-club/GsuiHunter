import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter.dart';
import 'package:g_sui_hunter/models/quest.dart';
import 'package:g_sui_hunter/constants.dart';

class AddResultModel extends ChangeNotifier {
  Hunter hunter;
  Quest currentQuest;

  Future clearQuest() async {
    final hunterRef = FirebaseFirestore.instance.collection('hunters').doc(hunter.id);
    final hunterData = await hunterRef.get();

    final currentQuestRef = hunterData.data()['currentQuest'];
    final currentQuestData = await currentQuestRef.get();

    final hunterRank = await _calcRank(hunterData, currentQuestData);

    hunterRef.update({
      'currentQuest': null,
      'quests': FieldValue.arrayUnion([currentQuestRef]),
      'rank' : hunterRank,
      'exp': FieldValue.increment(currentQuestData.data()['rank']*10),
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

  Future _calcRank(DocumentSnapshot hunterData, DocumentSnapshot currentQuestData) async {
    final int preRank = await hunterData.data()['rank'];

    if (preRank == 5) {
      return preRank;
    }

    final int rankUpExp = rankUpExpRule[preRank];
    final int preExp = await hunterData.data()['exp'];

    if (rankUpExp <= preExp + preRank*10) {
      return preRank + 1;
    } else {
      return preRank;
    }
  }

}
