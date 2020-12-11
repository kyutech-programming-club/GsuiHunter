import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:g_sui_hunter/models/hunter.dart';
import 'package:g_sui_hunter/models/quest.dart';
import 'package:g_sui_hunter/models/result.dart';

class ResultModel extends ChangeNotifier {
  List<Result> resultList = [];

  Future fetchResult(Hunter hunter) async {
    final resultList = [];
    final ownRef = FirebaseFirestore.instance.collection('hunters').doc(hunter.id);
    final hunterRefs = hunter.followee + [ownRef];

    for (DocumentReference hunterRef in hunterRefs) {
      final QuerySnapshot snapshots = await FirebaseFirestore.instance
          .collection('results')
          .where('hunterRef', isEqualTo: hunterRef)
          .get();

      await Future.wait(
        snapshots.docs.map((doc) async {
          final hunter = Hunter(await doc.data()['hunterRef'].get());
          final quest = Quest(await doc.data()['questRef'].get());
          resultList.add(Result(doc, hunter, quest));
        }),
      );
    }

    this.resultList = List<Result>.from(resultList);
    this.resultList.sort((first, second) => second.clearedAt.compareTo(first.clearedAt));
    notifyListeners();
  }
}
