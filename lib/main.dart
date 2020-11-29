import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:g_sui_hunter/views/root_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '自炊ハンター',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              color: Colors.red,
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return RootPage();
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
