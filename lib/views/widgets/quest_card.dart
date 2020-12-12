import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter_model.dart';
import 'package:g_sui_hunter/models/quest.dart';
import 'package:g_sui_hunter/views/quest_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class QuestCard extends StatelessWidget {
  const QuestCard({
    Key key,
    this.data
  }) : super(key: key);

  final Quest data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuestDetailPage(data: data),
              ),
            );
          },
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(data.title),
                ),
                Expanded(
                  child: Center(
                    child: CachedNetworkImage(
                      placeholder: (context, url) => CircularProgressIndicator(),
                      imageUrl: data.imageUrl,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Selector<HunterModel, int>(
          selector: (context, model) => model.hunter.rank,
          builder: (context, rank, child) {
            if (rank >= data.rank) {
              return Container();
            } else {
              return GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('挑戦できません'),
                      content: Text('これはRank${data.rank}のクエストです'),
                      actions: [
                        CupertinoDialogAction(
                          child: Text('OK'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    );
                  },
                ),
                child: Opacity(
                  opacity: 0.8,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.grey,
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return Icon(
                          Icons.lock,
                          color: Colors.yellow,
                          size: constraints.maxWidth * 0.5,
                        );
                      },
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
