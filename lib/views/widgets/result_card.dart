import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/result.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    Key key,
    this.result
  }) : super(key: key);

  final Result result;

  @override
  Widget build(BuildContext context) {
    return Text(
      result.comment,
    );
  }
}
