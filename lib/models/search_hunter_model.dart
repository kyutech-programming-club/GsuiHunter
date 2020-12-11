import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter.dart';

class SearchHunterModel extends ChangeNotifier {
  List<Hunter> hunterList = [];
  String targetHunterName = '';

  void changeTargetHunterName(name) {
    this.targetHunterName = name;
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
