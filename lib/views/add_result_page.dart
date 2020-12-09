import 'package:flutter/material.dart';

class AddResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('クエスト結果'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.orange,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
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
            ),
          ),
        ],
      ),
    );
  }
}
