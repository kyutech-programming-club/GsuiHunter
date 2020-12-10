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

    final hunterRankAndExp = _calcRankAndExp(hunterData, currentQuestData);

    hunterRef.update({
      'rank' : hunterRankAndExp['rank'],
      'exp': hunterRankAndExp['exp'],
      'currentQuest': null,
      'quests': FieldValue.arrayUnion([currentQuestRef]),
    });
    hunter.currentQuest = null;
    hunter.rank = hunterRankAndExp['rank'];
    hunter.exp = hunterRankAndExp['exp'];
    notifyListeners();
  }

  Future createState(Hunter hunter) async {
    this.hunter = hunter;

    final questSnapshot = await hunter.currentQuest.get();
    this.currentQuest = Quest(questSnapshot);

    notifyListeners();
  }

  Map<String, int> _calcRankAndExp(DocumentSnapshot hunterData, DocumentSnapshot currentQuestData) {
    final int preRank = hunterData.data()['rank'];
    final int questRank = currentQuestData.data()['rank'];

    if (preRank == 5) {
      return {
        'rank' : preRank,
        'exp' : rankUpExpRule[preRank],
      };
    }

    final int rankUpExp = rankUpExpRule[preRank];
    final int preExp = hunterData.data()['exp'];

    final bool isRankUp = (rankUpExp <= preExp + questRank*10);
    if (isRankUp) {
      final extraExp = preExp + questRank*10 - rankUpExp;
      return {
        'rank' : preRank + 1,
        'exp' : preRank + 1 == 5 ? 500 : extraExp,
      };
    } else {
      return {
        'rank' : preRank,
        'exp' : preExp + questRank*10,
      };
    }
  }

}
