import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ) ;
  }
}
