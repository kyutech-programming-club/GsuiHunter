import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/quest_model.dart';
import 'package:g_sui_hunter/views/widgets/quest_card.dart';
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
                    data: quest,
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
