import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:g_sui_hunter/models/result.dart';

class ResultModel extends ChangeNotifier {
  List<Result> resultList = [];

  Future fetchResult() async {
    final QuerySnapshot questSnapshots = await FirebaseFirestore.instance.collection('results').orderBy('clearedAt', descending: true).get();
    final resultList = questSnapshots.docs.map((doc) => Result(doc)).toList();
    this.resultList = resultList;
    notifyListeners();
  }
}
