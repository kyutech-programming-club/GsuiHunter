import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ClearQuestInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
    );
  }
}
