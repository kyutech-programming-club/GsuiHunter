import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:g_sui_hunter/models/hunter.dart';
import 'package:g_sui_hunter/models/quest.dart';
import 'package:g_sui_hunter/models/result.dart';

class ResultModel extends ChangeNotifier {
  List<Result> resultList = [];

  Future fetchResult() async {
    final QuerySnapshot questSnapshots = await FirebaseFirestore.instance.collection('results').orderBy('clearedAt', descending: true).get();
    final resultList = [];
    await Future.forEach(questSnapshots.docs, (doc) async {
      final hunter = Hunter(await doc.data()['hunterRef'].get());
      final quest = Quest(await doc.data()['questRef'].get());
      resultList.add(Result(doc, hunter, quest));
    });
    this.resultList = List<Result>.from(resultList);
    notifyListeners();
  }
}
