import 'package:flutter/material.dart';
import 'package:news/src/models/item_model.dart';
import 'package:news/src/widgets/loading_container.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;
  final int depth;

  Comment({this.itemId, this.itemMap, this.depth});

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemMap[itemId],
      builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final item = snapshot.data;

        final children = <Widget>[
          ListTile(
            title: buildText(item),
            subtitle: item.by == '' ? Text('Deleted') : Text(item.by),
            contentPadding:
                EdgeInsets.only(right: 16.0, left: (depth + 1) * 16.0),
          ),
          Divider(
            color: Colors.black,
          ),
        ];
        item.kids.forEach((kidId) {
          children.add(
            Comment(
              itemId: kidId,
              itemMap: itemMap,
              depth: depth + 1,
            ),
          );
        });

        return Column(
          children: children,
        );
      },
    );
  }

  buildText(ItemModel item) {
    final text = item.text
        .replaceAll('&#x27', "'")
        .replaceAll('<p>', '\n\n')
        .replaceAll('</p>', '')
        .replaceAll('&quot;', '"')
        .replaceAll(";", '')
        .replaceAll('&gt', '>');

    return Text(text);
  }
}
