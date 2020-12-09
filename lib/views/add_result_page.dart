import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            child: Padding(
              padding: EdgeInsets.all(10),
              child:  Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'クリアタイム',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextField(
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Text(
                    '分',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('コメント'),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'クリアのコツや感想を教えてください',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
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
