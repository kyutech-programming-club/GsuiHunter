import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/quest.dart';
import 'package:g_sui_hunter/models/user_auth_model.dart';
import 'package:provider/provider.dart';
import 'package:g_sui_hunter/models/quest_model.dart';
import 'package:g_sui_hunter/views/widgets/quest_card.dart';

class QuestListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.select<UserAuthModel, User>((value) => value.user);
    return Scaffold(
      appBar: AppBar(
        title: Text('自炊ハンター'),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(user.photoURL),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await context.read<UserAuthModel>().signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  child: ButtonTheme(
                    minWidth: 40.0,
                    height: 20.0,
                    child:  RaisedButton(
                      child: Text("クエスト受注中"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "GR0",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                child: Text(
                  "ハンター",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "クエスト追加→",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: IconButton(
                    icon: Icon(Icons.control_point_rounded),
                    onPressed: () {
                      Navigator.pushNamed(context,'/add_quest');
                    },
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
              height: 200.0,
              child: Selector<QuestModel, List<Quest>>(
                builder: (context, model, child) {
                  final questList = model.map((quest) =>
                      QuestCard(
                        data: quest,
                      ),
                  ).toList();
                  return GridView.count(
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    crossAxisCount: 2,
                    children: questList,
                  );
                },
                selector: (context, model) => model.questList,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
