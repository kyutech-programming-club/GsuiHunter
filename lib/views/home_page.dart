import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter.dart';
import 'package:g_sui_hunter/models/hunter_model.dart';
import 'package:g_sui_hunter/models/tag.dart';
import 'package:g_sui_hunter/models/tag_model.dart';
import 'package:g_sui_hunter/models/user_auth_model.dart';
import 'package:g_sui_hunter/views/quest_list_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hunter = context.select<HunterModel, Hunter>((value) => value.hunter);
    final tagList = context.select<TagModel, List<Tag>>((value) => value.tagList);
    if (hunter == null || tagList == []) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(appBar: AppBar(
        title: Text('自炊ハンター'),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              context.select<UserAuthModel, String>((value) => value.user.photoURL),
            ),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await context.read<UserAuthModel>().signOut();
            },
          ),
        ],
      ),
        body: QuestListPage(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.kitchen),
              label: 'クエスト',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timeline),
              label: 'みんなの自炊',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'マイページ',
            ),
          ],
        ),
      );
    }
  }
}
