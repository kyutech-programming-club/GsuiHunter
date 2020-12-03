import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter_model.dart';
import 'package:g_sui_hunter/models/user_auth_model.dart';
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
        return Scaffold(
          appBar: AppBar(
            title: Text('HOME'),
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
          body: Center(
            child: RaisedButton(
              child: Text('create hunter'),
              onPressed: () => context.read<HunterModel>().getHunter(),
            ),
          ),
        );
      },
    );
  }
}
