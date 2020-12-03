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
        Future fetchFireStore() async {
          await context.select<HunterModel, Future>((value) => value.fetchHunter());
          return 'Completed fetch!';
        }

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
            child: FutureBuilder(
              future: fetchFireStore(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.hasData) {
                  return Text(snapshot.data);
                } else {
                  return Text("Data does not exist");
                }
              },
            ),
          ),
        );
      },
    );
  }
}
