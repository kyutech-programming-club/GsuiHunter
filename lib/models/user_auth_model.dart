import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthModel extends ChangeNotifier {
  User user;
  bool isSignInWaiting = false;

  void switchWaitingState() {
    isSignInWaiting = !isSignInWaiting;
    notifyListeners();
  }

  void getUserState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User user) {
      this.user = user;
      notifyListeners();
    });
  }

  Future signIn() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      this.isSignInWaiting = false;
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      print(error);
    }
  }

  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
    } catch (error) {
      print(error);
    }
  }
}
