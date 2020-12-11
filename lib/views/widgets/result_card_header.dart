import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/result.dart';

class ResultCardHeader extends StatelessWidget {
  const ResultCardHeader({
    Key key,
    this.result
  }) : super(key: key);

  final Result result;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              result.hunter.photoUrl,
            ),
          ),
        ),
        Text(result.hunter.name),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: Text(
            '${result.clearedAt.month}月${result.clearedAt.day}日 '
                '${result.clearedAt.hour}:${result.clearedAt.minute}',
          ),
        ),
      ],
    );
  }
}
