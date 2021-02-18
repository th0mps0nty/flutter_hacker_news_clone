import 'package:flutter/material.dart';
import 'package:news/src/bloc/comments_provider.dart';
import 'package:news/src/screens/news_detail.dart';
import 'package:news/src/screens/news_list.dart';
import 'bloc/stories_provider.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return CommentsProvider(
      child: StoriesProvider(
        child: MaterialApp(
          title: 'News!',
          onGenerateRoute: routes,
        ),
      ),
    );
  }

  Route routes(RouteSettings settings) {
    return settings.name == '/'
        ? MaterialPageRoute(
            builder: (context) {
              return NewsList();
            },
          )
        : MaterialPageRoute(
            builder: (context) {
              final commentsBloc = CommentsProvider.of(context);
              final itemId = int.parse(settings.name.replaceFirst('/', ''));

              commentsBloc.fetchItemWithComments(itemId);

              return NewsDetail(itemId: itemId);
            },
          );
  }
}
