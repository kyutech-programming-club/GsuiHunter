import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/quest.dart';
import 'package:g_sui_hunter/views/widgets/current_quest_status.dart';
import 'package:provider/provider.dart';
import 'package:g_sui_hunter/models/quest_model.dart';
import 'package:g_sui_hunter/views/widgets/quest_card.dart';

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
          child: RefreshIndicator(
            onRefresh: () async => context.read<QuestModel>().fetchQuest(),
            child: Selector<QuestModel, List<Quest>>(
              builder: (context, model, child) {
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
              },
              selector: (context, model) => model.questList,
            ),
          ),
        ),
      ],
    );
  }
}
