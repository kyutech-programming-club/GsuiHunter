import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/add_result_model.dart';
import 'package:provider/provider.dart';

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
                onChanged: (time) {
                  context.read<AddResultModel>().changeClearTime(int.parse(time));
                },
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
