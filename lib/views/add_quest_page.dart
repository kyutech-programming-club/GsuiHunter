import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/add_quest_model.dart';
import 'package:g_sui_hunter/views/add_quest_form.dart';
import 'package:provider/provider.dart';

class AddQuestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddQuestModel>(
      create: (_) => AddQuestModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('新規追加'),
        ),
        body: AddQuestForm(),
      ),
    );
  }
}
