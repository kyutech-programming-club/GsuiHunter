import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/quest.dart';
import 'package:g_sui_hunter/views/quest_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';

class QuestCard extends StatelessWidget {
  const QuestCard({
    Key key,
    this.data
  }) : super(key: key);

  final Quest data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
