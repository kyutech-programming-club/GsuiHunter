import 'package:flutter/material.dart';

class BottomNavModel extends ChangeNotifier {
  int currentIndex = 0;

  switchCurrentIndex(int index) {
    this.currentIndex = index;
    notifyListeners();
  }
}
