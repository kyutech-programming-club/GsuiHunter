import 'package:g_sui_hunter/models/quest.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/search_quest_model.dart';
import 'package:provider/provider.dart';
import 'package:g_sui_hunter/models/quest_model.dart';
import 'package:g_sui_hunter/views/widgets/quest_card.dart';

class SearchedQuestList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<QuestModel>().fetchQuest(),
      child: Selector<SearchQuestModel, List<Quest>>(
        selector: (context, model) => model.questList,
        builder: (context, model, child) {
          if (model == null) {
            return Text('見つかりませんでした');
          } else {
            final questList = model.map((quest) =>
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
          }
        },
      ),
    );
  }
}
