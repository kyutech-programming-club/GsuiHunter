import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter.dart';

class HunterModel extends ChangeNotifier {
  HunterModel(this.currentUser);

  User currentUser;
  Hunter hunter;

  Future fetchHunter() async {
    final hunterRef = FirebaseFirestore.instance.collection('hunters').doc(currentUser.uid);
    final hunterSnapshot = await hunterRef.get();

    if (hunterSnapshot.exists) {
      this.hunter = Hunter(hunterSnapshot);
      print("Welcome back");
    } else {
      hunterRef.set({
        'name': currentUser.displayName,
        'rank': 1,
        'exp': 0,
        'currentQuest': null,
      })
          .then((value) async {
        this.hunter = Hunter(await hunterRef.get());
        print("New Hunter Added");
      })
          .catchError((error) => print("Failed to add hunter: $error"));
    }
  }
}
