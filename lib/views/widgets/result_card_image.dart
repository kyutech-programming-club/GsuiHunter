import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/result.dart';

class ResultCardImage extends StatelessWidget {
  const ResultCardImage({
    Key key,
    this.result
  }) : super(key: key);

  final Result result;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        placeholder: (context, url) => CircularProgressIndicator(),
        imageUrl: result.quest.imageUrl,
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
