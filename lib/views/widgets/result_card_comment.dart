import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/result.dart';

class ResultCardComment extends StatelessWidget {
  const ResultCardComment({
    Key key,
    this.result
  }) : super(key: key);

  final Result result;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: AutoSizeText(
          '${result.comment}',
          maxLines: 2,
          style: TextStyle(
            fontSize: 100,
          ),
        ),
      ),
    );
  }
}
