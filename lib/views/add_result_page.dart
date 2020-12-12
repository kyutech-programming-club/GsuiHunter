import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:g_sui_hunter/models/add_result_model.dart';
import 'package:g_sui_hunter/models/hunter_model.dart';
import 'package:g_sui_hunter/models/quest.dart';
import 'package:g_sui_hunter/views/widgets/clear_comment_form.dart';
import 'package:g_sui_hunter/views/widgets/clear_quest_button.dart';
import 'package:g_sui_hunter/views/widgets/clear_quest_image.dart';
import 'package:g_sui_hunter/views/widgets/clear_quest_info.dart';
import 'package:g_sui_hunter/views/widgets/clear_time_form.dart';
import 'package:provider/provider.dart';

class AddResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddResultModel>(
      create: (_) {
        final hunter = context.read<HunterModel>().hunter;
        return AddResultModel()..createState(hunter);
      },
      builder: (context, child) {
        final currentQuest = context.select<AddResultModel, Quest>((model) => model.currentQuest);
        return Scaffold(
          appBar: AppBar(
            title: Text('クエスト結果'),
          ),
          body: currentQuest == null ?
          Center(
            child: CircularProgressIndicator(),
          ) :
          Stack(
            children: [
              SingleChildScrollView(
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
              Align(
                alignment: Alignment.center,
                child: Selector<HunterModel, bool>(
                  selector: (context, model) => model.animationVisible,
                  builder: (context, animationVisible, child) {
                    if (!animationVisible) {
                      return Container();
                    }
                    return AnimatedOpacity(
                      opacity: animationVisible ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 100),
                      child: Image(
                        image: AssetImage('assets/images/quest_clear.png'),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
