import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/add_quest_model.dart';
import 'package:provider/provider.dart';

class AddQuestForm extends StatefulWidget {
  @override
  _AddQuestFormState createState() => _AddQuestFormState();
}

class _AddQuestFormState extends State<AddQuestForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: "クエスト名を入力してください",
            hintText: "例：激辛カレー",
          ),
          onChanged: (text) {
            context.read<AddQuestModel>().changeQuestName(text);
          },
        ),
        RaisedButton(
          child: Text("クエスト追加"),
          onPressed: () async{
            await context.read<AddQuestModel>().add();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}