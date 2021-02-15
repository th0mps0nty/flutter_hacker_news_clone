import 'package:flutter/material.dart';
import 'package:news/src/screens/news_detail.dart';
import 'package:news/src/screens/news_list.dart';
import 'bloc/stories_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News!',
        onGenerateRoute: routes,
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
              return NewsDetail();
            },
          );
  }
}
