import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/user_auth_model.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserAuthModel()..getCurrentUser(),
      child: Consumer
      <UserAuthModel>(
          builder: (context, model, child) {
            if (model.user == null) {
              return Container(
                color: Colors.green,
              );
            } else {
              return Container(
                color: Colors.orange,
              );
            }
          },
      ),
    );
  }
}
