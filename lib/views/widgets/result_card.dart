import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/result.dart';
import 'package:g_sui_hunter/views/widgets/result_card_header.dart';
import 'package:g_sui_hunter/views/widgets/result_card_image.dart';
import 'package:g_sui_hunter/views/widgets/result_card_info.dart';

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
          child: Column(
            children: [
              Divider(
                color: Colors.black54,
                height: 3,
                thickness: 2,
              ),
              Expanded(
                flex: 2,
                child: ResultCardHeader(
                  result: result,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 13,
                child: ResultCardImage(
                  result: result,
                ),
              ),
              Expanded(
                flex: 2,
                child: ResultCardInfo(
                  result: result,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
