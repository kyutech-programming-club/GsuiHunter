import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/quest_model.dart';
import 'package:g_sui_hunter/quest.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '自炊ハンター',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('自炊ハンター'),
        ),
        body: ChangeNotifierProvider(
          create: (_) => QuestModel()..getQuest(),
          child: Consumer<QuestModel>(
            builder: (context, model, child) {
              final questList = model.questList.map((quest) =>
                  QuestCard(
                    name: quest.name,
                    pictureUrl: quest.pictureUrl,
                  ),
              ).toList();

              return  GridView.count(
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                crossAxisCount: 2,
                children: questList,
              );
            },
          ),
        ),
      ),
    );
  }
}

class QuestCard extends StatelessWidget {
  const QuestCard({
    Key key,
    this.name,
    this.pictureUrl,
  }) : super(key: key);

  final String name;
  final String pictureUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => Scaffold(
        //       appBar: AppBar(
        //         title: Text("クエスト詳細"),
        //       ),
        //       body: Column(
        //         children: [
        //           Text(quest.name),
        //           Image.network(quest.pictureUrl),
        //           Text('かかる時間:'+quest.time.toString()),
        //           Text('クエスト難易度:'+quest.diff.toString()),
        //         ],
        //       ),
        //     ),
        //   ),
        // );
      },
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(this.name),
            ),
            Image.network(this.pictureUrl)
          ],
        ),
      ),
    );
  }
}
