import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/quest.dart';

class QuestDetailPage extends StatelessWidget {
  const QuestDetailPage({
    Key key,
    this.data,
  }) : super(key: key);

  final Quest data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("クエスト詳細"),
      ),
      body: Column(
        children: [
          Text(data.title),
          Image.network(data.imageUrl),
          Text('かかる時間:'+ data.timeAve.toString()),
          Text('クエスト難易度:'+ data.rank.toString()),
        ],
      ),
    );
  }
}
