import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter_model.dart';
import 'package:g_sui_hunter/models/quest.dart';
import 'package:decoratable_text/decoratable_text.dart';
import 'package:provider/provider.dart';

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
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 4.0,
            controller: ScrollController(keepScrollOffset: false),
            scrollDirection: Axis.vertical,
            children: data.tags.map((value) {
              return Container(
                color: Colors.grey,
                child: Center(
                  child: Text(
                    value,
                  ),
                ),
              );
            }).toList(),
          ),
          Selector<HunterModel, DocumentReference>(
            selector: (context, model) => model.hunter.currentQuest,
            builder: (context, currentQuest, child) {
              if (currentQuest != null) {
                if (currentQuest.id == data.id) {
                  return FlatButton(
                    onPressed: () => print('TODO: クエストクリア時の処理'), // TODO: クエストクリア時の処理
                    color: Colors.red,
                    child: Text(
                      'クリアした！',
                    ),
                  );
                } else {
                  return FlatButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      final currentQuestData =  Quest(await currentQuest.get());
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestDetailPage(data: currentQuestData),
                        ),
                      );
                    },
                    color: Colors.grey,
                    child: Text(
                      '現在、別のクエスト中です',
                    ),
                  );
                }
              } else {
                return FlatButton(
                  onPressed: () => context.read<HunterModel>().orderQuest(data),
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'クエスト登録',
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
