import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
        ChangeNotifierProvider(
          create: (context) => HunterModel(user),
        ),
      ],
      builder: (context, child) {
        Future fetchFireStore() async {
          await context.select<HunterModel, Future>((value) => value.fetchHunter());
          return 'Completed fetch!';
        }

        return FutureBuilder(
          future: fetchFireStore(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return QuestListPage();
            } else {
              return Text("Data does not exist");
            }
          },
        );
      },
    );
  }
}
