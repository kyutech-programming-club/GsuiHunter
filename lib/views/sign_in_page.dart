import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/user_auth_model.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  RaisedButton(
      child: Text('Sign in with google'),
      onPressed: () async {
        await context.read<UserAuthModel>().signIn();
      },
    );
  }
}
