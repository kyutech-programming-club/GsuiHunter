import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/add_result_model.dart';
import 'package:provider/provider.dart';

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
        onPressed: () async {
          await context.read<AddResultModel>().clearQuest();
          await Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
        },
      ),
    );
  }
}
