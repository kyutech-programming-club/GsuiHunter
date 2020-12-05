import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/add_quest_model.dart';
import 'package:g_sui_hunter/models/tag.dart';
import 'package:g_sui_hunter/models/tag_model.dart';
import 'package:provider/provider.dart';

class AddQuestForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          Selector<AddQuestModel, String>(
            selector: (context, model) => model.groupValue,
            builder: (context, groupValue, child) {
              final questRank = context.select<AddQuestModel, List<String>>(
                    (value) => value.questRank,
              );
              final rankChoices = questRank.map((value) => Column(
                children: [
                  Radio(
                    value: value,
                    groupValue: groupValue,
                    onChanged: (value) => context.read<AddQuestModel>().choiceRank(value),
                  ),
                  Text(value),
                ],
              ),
              ).toList();
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: rankChoices,
              );
            },
          ),
          Selector<TagModel, List<Tag>>(
            selector: (context, model) => model.tagList,
            builder: (context, tagList, child) {
              final checkBox = tagList.map((tag) {
                return CheckboxListTile(
                  title: Text(tag.name),
                  value: true,
                  onChanged: (value) {
                    print(tag);
                  },
                );
              }).toList();

              return Column(
                children: checkBox,
              );
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
      ),
    );
  }
}
