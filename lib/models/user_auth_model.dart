import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthModel extends ChangeNotifier {
  User user;

  void getUserState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User user) {
      this.user = user;
      notifyListeners();
    });
  }

  Future<UserCredential> signIn() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
