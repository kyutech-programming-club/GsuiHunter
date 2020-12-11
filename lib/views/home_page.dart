import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/bottom_nav_model.dart';
import 'package:g_sui_hunter/models/hunter.dart';
import 'package:g_sui_hunter/models/hunter_model.dart';
import 'package:g_sui_hunter/models/result.dart';
import 'package:g_sui_hunter/models/result_model.dart';
import 'package:g_sui_hunter/models/tag.dart';
import 'package:g_sui_hunter/models/tag_model.dart';
import 'package:g_sui_hunter/models/user_auth_model.dart';
import 'package:g_sui_hunter/views/search_hunter_page.dart';
import 'package:g_sui_hunter/views/result_list_page.dart';
import 'package:g_sui_hunter/views/quest_list_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hunter = context.select<HunterModel, Hunter>((value) => value.hunter);
    final tagList = context.select<TagModel, List<Tag>>((value) => value.tagList);
    final resultList = context.select<ResultModel, List<Result>>((value) => value.resultList);
    if (hunter == null || tagList == [] || resultList == []) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      final int currentIndex = context.select<BottomNavModel, int>((model) => model.currentIndex);
      final List<Widget> pages = [
        QuestListPage(),
        SearchQuestPage(),
        ResultListPage(),
      ];
      return Scaffold(appBar: AppBar(
        title: Text('自炊ハンター'),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              context.select<HunterModel, String>((value) => value.hunter.photoUrl),
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
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            context.read<BottomNavModel>().switchCurrentIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.kitchen),
              label: 'クエスト',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'サーチ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timeline),
              label: 'みんなの自炊',
            ),
          ],
        ),
      );
    }
  }
}
