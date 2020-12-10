import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/search_quest_model.dart';
import 'package:g_sui_hunter/views/widgets/current_quest_status.dart';
import 'package:g_sui_hunter/views/widgets/seached_quest_list.dart';
import 'package:g_sui_hunter/views/widgets/serach_quest_form.dart';
import 'package:provider/provider.dart';

class SearchQuestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchQuestModel>(
      create: (context) => SearchQuestModel()..searchQuest('フライパン'),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: CurrentQuestStatus(),
          ),
          Expanded(
            flex: 2,
            child: SearchQuestForm(),
          ),
          Expanded(
            flex: 7,
            child: SearchedQuestList(),
          ),
        ],
      ),
    );
  }
}
