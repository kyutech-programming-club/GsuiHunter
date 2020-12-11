import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:g_sui_hunter/models/add_result_model.dart';
import 'package:provider/provider.dart';

class ClearQuestImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 1.0,
                blurRadius: 10.0,
                offset: Offset(10, 10),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Selector<AddResultModel, String>(
              selector: (context, model) => model.currentQuest.imageUrl,
              builder: (context, imageUrl, child) {
                return CachedNetworkImage(
                  placeholder: (context, url) => CircularProgressIndicator(),
                  imageUrl: imageUrl,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                );
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            icon: Icon(Icons.camera_alt),
            iconSize: 50,
            onPressed: () => print('カメラ起動'),
          ),
        ),
      ],
    );
  }
}
