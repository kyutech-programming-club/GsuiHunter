import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/search_quest_model.dart';
import 'package:g_sui_hunter/models/tag.dart';
import 'package:g_sui_hunter/models/tag_model.dart';
import 'package:provider/provider.dart';

class SearchQuestForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tagList = context.select<TagModel, List<Tag>>((model) => model.tagList);
    return DropdownButton(
      value: context.select<SearchQuestModel, String>((model) => model.targetTag),
      icon: Icon(Icons.search),
      items: tagList.map((tag){
        return DropdownMenuItem(
          value: tag.name,
          child: Text(tag.name),
        );
      }).toList(),
      onChanged: (tag) {
        context.read<SearchQuestModel>().changeTargetTag(tag);
        context.read<SearchQuestModel>().searchQuest();
      },
    );
  }
}
