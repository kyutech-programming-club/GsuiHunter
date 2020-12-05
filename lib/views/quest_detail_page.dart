import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/quest.dart';
import 'package:decoratable_text/decoratable_text.dart';

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
          Container(
            color: Colors.black54,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.network(data.imageUrl),
          ),
          Text(
            data.title,
            style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text('かかる時間:' + data.timeAve.toString()),
          Text('クエスト難易度:' + data.rank.toString()),
          DecoratableText(
            text: data.siteUrl,
            decorations: [
              DecorationOption(
                pattern: TextPattern.url,
                style: TextStyle(color: Colors.blue),
                tapAction: TapAction.launchUrl,
                showRipple: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
