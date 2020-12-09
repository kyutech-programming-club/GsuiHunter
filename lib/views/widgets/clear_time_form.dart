import 'package:flutter/material.dart';

class ClearTimeForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                keyboardType: TextInputType.number,
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
    );
  }
}
