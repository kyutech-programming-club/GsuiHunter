import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter.dart';
import 'package:g_sui_hunter/models/quest.dart';

class HunterModel extends ChangeNotifier {
  User currentUser = FirebaseAuth.instance.currentUser;
  Hunter hunter;
  bool animationVisible = false;

  void switchAnimationVisible() {
    this.animationVisible = !this.animationVisible;
    notifyListeners();
  }

  Future fetchHunter() async {
    final hunterRef = FirebaseFirestore.instance.collection('hunters').doc(currentUser.uid);
    final hunterSnapshot = await hunterRef.get();

    if (hunterSnapshot.exists) {
      this.hunter = Hunter(hunterSnapshot);
      print("Welcome back");
      notifyListeners();
    } else {
      hunterRef.set({
        'name': currentUser.displayName,
        'photoUrl': currentUser.photoURL,
        'rank': 1,
        'exp': 0,
        'currentQuest': null,
      })
          .then((value) async {
        this.hunter = Hunter(await hunterRef.get());
        print("New Hunter Added");
        notifyListeners();
      })
          .catchError((error) => print("Failed to add hunter: $error"));
    }
  }

  Future orderQuest(Quest data) async {
    final hunterRef = FirebaseFirestore.instance.collection('hunters').doc(hunter.id);
    final questRef = FirebaseFirestore.instance.collection('quests').doc(data.id);

    hunter.currentQuest  = questRef;
    notifyListeners();
    hunterRef.update({
      'currentQuest': questRef,
    })
        .then((value) => notifyListeners())
        .catchError((error) => print("Failed to order quest: $error"));
  }

  Future clearQuest() async {
    final hunterRef = FirebaseFirestore.instance.collection('hunters').doc(hunter.id);
    hunterRef.update({
      'currentQuest': null,
    })
        .then((value) => notifyListeners())
        .catchError((error) => print("Failed to clear quest: $error"));

    hunter.currentQuest = null;
    notifyListeners();
  }

  Future followHunter(DocumentReference targetHunter) async {
    final hunterRef = FirebaseFirestore.instance
        .collection('hunters').doc(this.hunter.id);
    hunterRef.update({
      'followee': FieldValue.arrayUnion([targetHunter]),
    })
        .then((value) => print('Follow new hunter'))
        .catchError((error) => print("Failed to follow hunter: $error"));
    this.hunter.followee == null ?
    this.hunter.followee = [targetHunter] :
    this.hunter.followee.add(targetHunter);
    notifyListeners();
  }

  Future unFollowHunter(DocumentReference targetHunter) async {
    final hunterRef = FirebaseFirestore.instance
        .collection('hunters').doc(this.hunter.id);

    hunterRef.update({
      'followee': FieldValue.arrayRemove([targetHunter]),
    })
        .then((value) => print('Unfollow hunter'))
        .catchError((error) => print("Failed to unfollow hunter: $error"));

    this.hunter.followee.remove(targetHunter);
    notifyListeners();
  }
}
