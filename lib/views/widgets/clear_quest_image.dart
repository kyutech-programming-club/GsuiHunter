import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:g_sui_hunter/models/add_result_model.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

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
            child: Selector<AddResultModel, Tuple2<String, File>>(
              selector: (context, model) => Tuple2(model.currentQuest.imageUrl, model.pickedImage),
              builder: (context, model, child) {
                if (model.item2 == null) {
                  return CachedNetworkImage(
                    placeholder: (context, url) => CircularProgressIndicator(),
                    imageUrl: model.item1,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  );
                } else {
                  return Image.file(model.item2);
                }
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            icon: Icon(Icons.camera_alt),
            iconSize: 50,
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (BuildContext bc) {
                return SafeArea(
                  child: Container(
                    child: Wrap(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.photo_library),
                          title: Text('ライブラリ'),
                          onTap: () {
                            context.read<AddResultModel>().pickImageFromGallery();
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.photo_camera),
                          title: Text('カメラ'),
                          onTap: () {
                            context.read<AddResultModel>().pickImageFromCamera();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
