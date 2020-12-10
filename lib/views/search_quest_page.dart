import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter_model.dart';
import 'package:g_sui_hunter/models/quest.dart';
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  child: ButtonTheme(
                    minWidth: 40.0,
                    height: 20.0,
                    child:  RaisedButton(
                      child: Selector<HunterModel, DocumentReference>(
                        selector: (context, model) => model.hunter.currentQuest,
                        builder: (context, currentQuest, child) {
                          if (currentQuest == null) {
                            return Text("クエスト未選択");
                          } else {
                            return Text("クエスト中");
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
