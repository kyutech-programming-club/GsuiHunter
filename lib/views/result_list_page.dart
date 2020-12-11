import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter.dart';
import 'package:g_sui_hunter/models/result.dart';
import 'package:g_sui_hunter/models/result_model.dart';
import 'package:g_sui_hunter/views/widgets/current_quest_status.dart';
import 'package:g_sui_hunter/views/widgets/result_card.dart';
import 'package:provider/provider.dart';

class ResultListPage extends StatelessWidget {
  const ResultListPage({
    Key key,
    this.hunter
  }) : super(key: key);

  final Hunter hunter;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ResultModel>(
      create: (context) => ResultModel()..fetchResult(hunter),
      builder: (context, child) {
        return Column(
          children: [
            Expanded(
              flex: 1,
              child: CurrentQuestStatus(),
            ),
            Expanded(
              flex: 9,
              child: Selector<ResultModel, List<Result>>(
                selector: (context, model) => model.resultList,
                builder: (context, model, child) {
                  if (model.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final resultList = model.map((result) =>
                        ResultCard(
                          result: result,
                        ),
                    ).toList();
                    return RefreshIndicator(
                      onRefresh: () async => context.read<ResultModel>().fetchResult(hunter),
                      child: ListView(
                        children: resultList,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
