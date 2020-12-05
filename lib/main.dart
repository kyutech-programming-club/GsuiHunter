import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:g_sui_hunter/models/user_auth_model.dart';
import 'package:g_sui_hunter/views/add_quest_page.dart';
import 'package:g_sui_hunter/views/root_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserAuthModel()..getUserState(),
      child: MaterialApp(
        title: '自炊ハンター',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => RootPage(),
          '/add_quest': (BuildContext context) => AddQuestPage(),
        },
      ),
    );
  }
}
