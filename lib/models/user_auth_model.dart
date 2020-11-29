import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuthModel extends ChangeNotifier {
  User user;

  Future getCurrentUser() async {
    this.user = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }
}
