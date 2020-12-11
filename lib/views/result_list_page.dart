import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/result.dart';
import 'package:g_sui_hunter/models/result_model.dart';
import 'package:g_sui_hunter/views/widgets/current_quest_status.dart';
import 'package:provider/provider.dart';

class ResultListPage extends StatelessWidget {
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
            onRefresh: () async => context.read<ResultModel>().fetchResult(),
            child: Selector<ResultModel, List<Result>>(
              selector: (context, model) => model.resultList,
              builder: (context, model, child) {
                final resultList = model.map((result) =>
                    Text(
                      result.comment,
                    ),
                ).toList();
                return GridView.count(
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  crossAxisCount: 1,
                  children: resultList,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
