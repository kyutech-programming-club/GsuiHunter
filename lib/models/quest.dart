import 'package:cloud_firestore/cloud_firestore.dart';

class Quest {
  Quest(DocumentSnapshot doc){
    this.title = doc.data()['title'];
    this.siteUrl = doc.data()['siteUrl'];
    this.imageUrl = doc.data()['imageUrl'];
    this.rank  = doc.data()['rank'];
    this.timeAve = doc.data()['timeAve'];
    this.tags = doc.data()['tags'];
  }
  String title;
  String siteUrl;
  String imageUrl;
  int rank;
  int timeAve;
  List<String> tags;
}
