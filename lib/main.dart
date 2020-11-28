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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.portrait_rounded),
            ),
          ],
        ),
        body: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    child: ButtonTheme(
                      minWidth: 40.0,
                      height: 20.0,
                      child:  RaisedButton(
                        child: Text("クエスト受注中"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "GR0",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "ハンター",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
              ],
            ),
              TextField(
                enabled: true,
                maxLength: 20,
                maxLengthEnforced: false,
                style: TextStyle(color: Colors.black),
                obscureText: false,
                maxLines:1 ,
                decoration: InputDecoration(
                    labelText: "クエスト名",
                    hintText: "ここにクエスト名を入力してください"),
              ),
              Expanded(
              child: SizedBox(
                height: 200.0,
                child: ChangeNotifierProvider(
                  create: (_) => QuestModel()..getQuest(),
                  child: Consumer<QuestModel>(
                    builder: (context, model, child) {
                      final questList = model.questList.map((quest) =>
                          QuestCard(
                            data: quest,
                          ),
                      ).toList();
                      return GridView.count(
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 20.0,
                        crossAxisCount: 2,
                        children: questList,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
