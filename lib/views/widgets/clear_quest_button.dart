import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/add_result_model.dart';
import 'package:g_sui_hunter/models/hunter_model.dart';
import 'package:g_sui_hunter/models/quest_model.dart';
import 'package:g_sui_hunter/models/tag_model.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ClearQuestButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Selector<AddResultModel, Tuple2<String, int>>(
        selector: (context, model) => Tuple2(model.clearComment, model.clearTime),
        builder: (context, data, child ) {
          if (data.item1.isEmpty || data.item2 == null) {
            return FlatButton(
              color: Colors.grey,
              child: Text(
                'クエストクリア',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('まだだよ…'),
                      content: Text('クリアタイムとコメントを入力してね'),
                      actions: [
                        CupertinoDialogAction(
                          child: Text('OK'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          } else {
            return FlatButton(
              color: Colors.green,
              child: Text(
                'クエストクリア',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                await context.read<AddResultModel>().clearQuest();
                context.read<HunterModel>().fetchHunter();
                context.read<QuestModel>().fetchQuest();
                context.read<TagModel>().fetchTag();
                await Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
              },
            );
          }
        },
      ),
    );
  }
}
