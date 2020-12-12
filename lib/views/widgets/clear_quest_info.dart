import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:g_sui_hunter/models/add_result_model.dart';
import 'package:provider/provider.dart';

class ClearQuestInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Rank${context.select<AddResultModel, int>((model) => model.currentQuest.rank)}',
              style: TextStyle(
                fontSize: constraints.maxHeight * 0.1,
                fontWeight: FontWeight.bold,
              ),
            ),
            AutoSizeText(
              context.select<AddResultModel, String>((model) => model.currentQuest.title),
              style: TextStyle(
                fontSize: constraints.maxHeight * 0.2,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            Text(
              'をクリア！',
              style: TextStyle(
                fontSize: constraints.maxHeight * 0.1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }
}
