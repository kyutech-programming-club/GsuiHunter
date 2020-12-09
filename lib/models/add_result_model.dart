import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter.dart';

class AddResultModel extends ChangeNotifier {
  Hunter hunter;

  Future clearQuest() async {
    final hunterRef = FirebaseFirestore.instance.collection('hunters').doc(hunter.id);
    hunterRef.update({
      'currentQuest': null,
    });
    hunter.currentQuest = null;
    notifyListeners();
  }

  Future createState(Hunter hunter) async {
    this.hunter = hunter;
    notifyListeners();
  }

}
