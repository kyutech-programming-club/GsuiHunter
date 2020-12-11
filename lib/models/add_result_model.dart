import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter.dart';
import 'package:g_sui_hunter/models/quest.dart';
import 'package:g_sui_hunter/constants.dart';

class AddResultModel extends ChangeNotifier {
  Hunter hunter;
  Quest currentQuest;
  int clearTime;
  String clearComment = '';

  void changeClearTime(int time) {
    this.clearTime = time;
    notifyListeners();
  }

  void changeClearComment(String comment) {
    this.clearComment = comment;
    notifyListeners();
  }

  Future clearQuest() async {
    final hunterRef = FirebaseFirestore.instance.collection('hunters').doc(this.hunter.id);
    final currentQuestRef = FirebaseFirestore.instance.collection('quests').doc(this.currentQuest.id);

    await _updateCurrentQuestData();
    await _updateTagData();
    await _addResult();

    final hunterRankAndExp = _calcRankAndExp();
    final hunterSkills = _calcSkills();

    hunterRef.update({
      'rank' : hunterRankAndExp['rank'],
      'exp': hunterRankAndExp['exp'],
      'currentQuest': null,
      'quests': FieldValue.arrayUnion([currentQuestRef]),
      'skills': hunterSkills,
    });
  }

  Future createState(Hunter hunter) async {
    this.hunter = hunter;

    final questSnapshot = await hunter.currentQuest.get();
    this.currentQuest = Quest(questSnapshot);

    notifyListeners();
  }

  Map<String, int> _calcRankAndExp() {
    final int preRank = this.hunter.rank;
    final int questRank = this.currentQuest.rank;

    if (preRank == 5) {
      return {
        'rank' : preRank,
        'exp' : rankUpExpRule[preRank],
      };
    }

    final int rankUpExp = rankUpExpRule[preRank];
    final int preExp = this.hunter.exp;

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

  Map<String, int> _calcSkills() {
    Map<String, int> skills = {};
    final List<dynamic> questTags = this.currentQuest.tags;

    final preSkills = this.hunter.skills;
    if (preSkills == null) {
      questTags.forEach((tag) {
        skills[tag] = 1;
      });
    } else {
      skills = Map<String, int>.from(preSkills);
      questTags.forEach((tag) {
        if (skills[tag] == null) {
          skills[tag] = 1;
        } else {
          skills[tag] += 1;
        }
      });
    }
    return skills;
  }

  Future _updateCurrentQuestData() async {
    final int preTimeAve = this.currentQuest.timeAve;
    final int preOrderNum = this.currentQuest.orderNum;

    final timeAve = (preTimeAve * preOrderNum + this.clearTime) / (preOrderNum + 1);

    await FirebaseFirestore.instance.collection('quests').doc(this.currentQuest.id)
        .update({
      'orderNum': FieldValue.increment(1),
      'timeAve': timeAve.round(),
    });
  }

  Future _updateTagData() async {
    final currentQuestTagList = this.currentQuest.tags;
    final currentQuestRef = FirebaseFirestore.instance.collection('quests').doc(this.currentQuest.id);
    Future.forEach(
        currentQuestTagList, (tag) async {
      FirebaseFirestore.instance.collection('tags')
          .where('name', isEqualTo: tag)
          .limit(1)
          .get()
          .then((snapshot) {
        final tagId = snapshot.docs.first.id;
        FirebaseFirestore.instance.collection('tags')
            .doc(tagId)
            .update({
          'quests': FieldValue.arrayUnion([currentQuestRef]),
        });
      });
    });
  }

  Future _addResult() async {
    await FirebaseFirestore.instance.collection('results').add({
      'hunterRef': FirebaseFirestore.instance.collection('hunters').doc(this.hunter.id),
      'questRef': FirebaseFirestore.instance.collection('quests').doc(this.currentQuest.id),
      'comment': this.clearComment,
      'clearedAt': FieldValue.serverTimestamp(),
    })
        .then((value) => print("New Result Added"))
        .catchError((error) => print("Failed to add result: $error"));
  }
}
