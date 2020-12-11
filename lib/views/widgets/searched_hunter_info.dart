import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g_sui_hunter/models/hunter.dart';
import 'package:g_sui_hunter/models/hunter_model.dart';
import 'package:provider/provider.dart';

class SearchedHunterInfo extends StatelessWidget {
  SearchedHunterInfo({
    Key key,
    this.targetHunter
  }) : super(key: key);

  final Hunter targetHunter;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              targetHunter.photoUrl,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            '${targetHunter.name}',
          ),
        ),
        Expanded(
          flex: 1,
          child: Selector<HunterModel, List<dynamic>>(
            selector: (context, model) => model.hunter.followee,
            builder: (context, followee, child) {
              final targetHunterRef = FirebaseFirestore.instance
                  .collection('hunters').doc(this.targetHunter.id);

              if (followee != null && followee.contains(targetHunterRef)) {
                return RaisedButton(
                  onPressed: () async {
                    await context.read<HunterModel>().unFollowHunter(targetHunterRef);
                    await context.read<HunterModel>().fetchHunter();
                  },
                  color: Colors.lightBlue,
                  child: Text(
                    'フォロー中',
                  ),
                );
              } else {
                return RaisedButton(
                  onPressed: () async {
                    await context.read<HunterModel>().followHunter(targetHunterRef);
                    await context.read<HunterModel>().fetchHunter();
                  },
                  color: Colors.grey,
                  child: Text(
                    'フォローする',
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
