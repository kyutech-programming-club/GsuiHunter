import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter.dart';
import 'package:g_sui_hunter/models/hunter_model.dart';
import 'package:g_sui_hunter/models/user_auth_model.dart';
import 'package:g_sui_hunter/views/quest_list_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.select<UserAuthModel, User>((value) => value.user);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HunterModel>(
          create: (context) => HunterModel(user)..fetchHunter(),
        ),
      ],
      builder: (context, child) {
        final hunter = context.select<HunterModel, Hunter>((value) => value.hunter);
        if (hunter == null) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return QuestListPage();
        }
      },
    );
  }
}
