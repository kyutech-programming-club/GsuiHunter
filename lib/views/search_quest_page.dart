import 'package:flutter/material.dart';
import 'package:g_sui_hunter/views/widgets/current_quest_status.dart';
import 'package:g_sui_hunter/views/widgets/seached_quest_list.dart';

class SearchQuestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: CurrentQuestStatus(),
        ),
        Expanded(
          flex: 9,
          child: SearchedQuestList(),
        ),
      ],
    );
  }
}
