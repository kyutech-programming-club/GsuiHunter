import 'package:flutter/material.dart';

class ClearQuestButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        color: Colors.green,
        child: Text(
          'クエストクリア',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () => print('クエスト完了の処理'), // TODO: クエスト完了の処理
      ),
    );
  }
}
