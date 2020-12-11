import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/result.dart';

class ResultCardModel extends ChangeNotifier {
  Result result;

  Future createState(Result result) async {
    this.result = result;
    notifyListeners();
  }

}
