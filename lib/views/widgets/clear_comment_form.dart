import 'package:flutter/material.dart';

class ClearCommentForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
