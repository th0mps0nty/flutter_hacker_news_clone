import 'package:flutter/material.dart';
import 'package:news/src/screens/news_list.dart';
import 'bloc/stories_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News!',
        home: NewsList(),
      ),
    );
  }
}
