import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter.dart';

class SearchedHunterInfo extends StatelessWidget {
  SearchedHunterInfo({
    Key key,
    this.targetHunter
  }) : super(key: key);

  final Hunter targetHunter;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              targetHunter.photoUrl,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            '${targetHunter.name}',
          ),
        ),
        Expanded(
          flex: 1,
          child: RaisedButton(
            onPressed: () => print('フォロー処理'),
            child: Text(
              'フォローする',
            ),
          ),
        ),
      ],
    );
  }
}
