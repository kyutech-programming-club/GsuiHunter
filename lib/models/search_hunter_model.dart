import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter.dart';
import 'package:g_sui_hunter/models/quest.dart';

class SearchHunterModel extends ChangeNotifier {
  List<Quest> questList = [];
  String targetTag;

  List<Hunter> hunterList = [];
  String targetHunterName = '';

  void changeTargetTag(tag) {
    this.targetTag = tag;
    notifyListeners();
  }

  void changeTargetHunterName(name) {
    this.targetHunterName = name;
  }

  void searchQuest() async {
    if (this.targetTag == null) {
      final QuerySnapshot questSnapshots = await FirebaseFirestore.instance.collection('quests').orderBy('rank').get();
      final questList = questSnapshots.docs.map((doc) => Quest(doc)).toList();
      this.questList = questList;
      notifyListeners();
    } else {
      final QuerySnapshot tagData = await FirebaseFirestore.instance
          .collection('tags')
          .where('name', isEqualTo: this.targetTag)
          .limit(1)
          .get();
      final List<dynamic> questRefs = tagData.docs[0].data()['quests'];
      if (questRefs == null) {
        this.questList = null;
        notifyListeners();
      } else {
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
  }

  Future searchHunter() async {
    final QuerySnapshot snapshots = await FirebaseFirestore.instance
        .collection('hunters')
        .where('name', isEqualTo: this.targetHunterName)
        .get();
    if (snapshots.docs.isEmpty) {
      this.hunterList = [];
      notifyListeners();
    } else {
      final hunterList = snapshots.docs.map((doc) => Hunter(doc)).toList();
      this.hunterList = hunterList;
      notifyListeners();
    }
  }
}