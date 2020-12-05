import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:g_sui_hunter/models/quest_model.dart';

class AddQuestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新規追加'),
      ),
      body: Consumer<QuestModel>(builder: (context, model, child) {
        return Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "クエスト名を入力してください",
                hintText: "例：激辛カレー",
              ),
              onChanged: (text) {
                model.questName = text;
              },
            ),
            RaisedButton(
              child: Text("クエスト追加"),
              onPressed: () async{
                await model.add();
                Navigator.pop(context);
              },
            ),
          ],
        );
      }),
    );
  }
}
