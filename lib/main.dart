import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:g_sui_hunter/views/home_page.dart';
import 'package:g_sui_hunter/views/root_page.dart';
import 'package:g_sui_hunter/views/sign_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '自炊ハンター',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => RootPage(),
        '/signIn': (BuildContext context) => SignInPage(),
        '/home': (BuildContext context) => HomePage(),
      },
    );
  }
}
