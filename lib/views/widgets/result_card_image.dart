import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter_model.dart';
import 'package:g_sui_hunter/models/result.dart';
import 'package:g_sui_hunter/views/quest_detail_page.dart';
import 'package:provider/provider.dart';

class ResultCardImage extends StatelessWidget {
  const ResultCardImage({
    Key key,
    this.result
  }) : super(key: key);

  final Result result;

  @override
  Widget build(BuildContext context) {
    final hunterRank = context.select<HunterModel, int>((model) => model.hunter.rank);
    return GestureDetector(
      child: Center(
        child: CachedNetworkImage(
          placeholder: (context, url) => CircularProgressIndicator(),
          imageUrl: result.resultImageUrl !=  null ? result.resultImageUrl : result.quest.imageUrl,
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      onTap: () {
        if (hunterRank >= result.quest.rank) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuestDetailPage(data: result.quest),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('挑戦できません'),
                content: Text('これはRank${result.quest.rank}のクエストです'),
                actions: [
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}
