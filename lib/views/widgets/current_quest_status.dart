import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter_model.dart';
import 'package:provider/provider.dart';

class CurrentQuestStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            child: ButtonTheme(
              minWidth: 40.0,
              height: 20.0,
              child:  RaisedButton(
                child: Selector<HunterModel, DocumentReference>(
                  selector: (context, model) => model.hunter.currentQuest,
                  builder: (context, currentQuest, child) {
                    if (currentQuest == null) {
                      return Text("クエスト未選択");
                    } else {
                      return Text("クエスト中");
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
