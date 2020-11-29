import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/user_auth_model.dart';
import 'package:g_sui_hunter/views/sign_in_page.dart';
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
            return SignInPage();
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
