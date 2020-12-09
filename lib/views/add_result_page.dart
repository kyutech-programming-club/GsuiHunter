import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:g_sui_hunter/views/widgets/clear_time_form.dart';

class AddResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('クエスト結果'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Rank0',
                                style: TextStyle(
                                  fontSize: constraints.maxHeight * 0.1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              AutoSizeText(
                                'デミグラスハンバーグ',
                                style: TextStyle(
                                  fontSize: constraints.maxHeight * 0.2,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'をクリア！',
                                style: TextStyle(
                                  fontSize: constraints.maxHeight * 0.1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 1.0,
                              blurRadius: 10.0,
                              offset: Offset(10, 10),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CachedNetworkImage(
                            placeholder: (context, url) => CircularProgressIndicator(),
                            imageUrl: '',
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: ClearTimeForm(),
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
        ),
      ),
    );
  }
}
