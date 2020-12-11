import 'package:g_sui_hunter/models/hunter.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/search_hunter_model.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class SearchedQuestList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<SearchHunterModel, Tuple2<List<Hunter>, String>>(
      selector: (context, model) => Tuple2(model.hunterList, model.targetHunterName),
      builder: (context, model, child) {
        if (model.item1.isEmpty && model.item2.isEmpty) {
          return Container(
            color: Colors.red,
          );
        } else if (model.item1.isEmpty && model.item2.isNotEmpty) {
          return Text('見つかりませんでした');
        } else {
          final hunterList = model.item1.map((hunter) =>
              Text('${hunter.name}'),
          ).toList();
          return ListView(
            children: hunterList,
          );
        }
      },
    );
  }
}
