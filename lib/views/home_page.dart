import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/user_auth_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await context.read<UserAuthModel>().signOut();
              await context.read<UserAuthModel>().getCurrentUser();
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.orange,
      ),
    );
  }
}
