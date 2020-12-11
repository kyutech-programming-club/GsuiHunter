import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/search_hunter_model.dart';
import 'package:provider/provider.dart';

class SearchHunterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextField(
            onChanged: (name) {
              context.read<SearchHunterModel>().changeTargetHunterName(name);
            },
          ),
        ),
        FlatButton(
          onPressed: () {
            context.read<SearchHunterModel>().searchHunter();
          },
          child: Text('検索'),
        )
      ],
    );
  }
}
