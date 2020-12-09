import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:g_sui_hunter/views/widgets/clear_comment_form.dart';
import 'package:g_sui_hunter/views/widgets/clear_quest_button.dart';
import 'package:g_sui_hunter/views/widgets/clear_quest_image.dart';
import 'package:g_sui_hunter/views/widgets/clear_quest_info.dart';
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
                      child: ClearQuestInfo(),
                    ),
                    Expanded(
                      flex: 1,
                      child: ClearQuestImage(),
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
                child: ClearCommentForm(),
              ),
              Expanded(
                flex: 1,
                child: ClearQuestButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
