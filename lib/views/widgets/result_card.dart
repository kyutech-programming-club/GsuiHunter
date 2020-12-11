import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:g_sui_hunter/models/result.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    Key key,
    this.result
  }) : super(key: key);

  final Result result;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ( context, constraints) {
        return SizedBox(
          height: constraints.maxWidth,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 5,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 14,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
