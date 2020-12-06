import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/tag.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TagModel extends ChangeNotifier {
  List<Tag> tagList = [];

  void fetchTag() async {
    final QuerySnapshot tagSnapshots = await FirebaseFirestore.instance.collection('tags').get();
    final tagList = tagSnapshots.docs.map((doc) => Tag(doc)).toList();
    this.tagList = tagList;
    notifyListeners();
  }
}
