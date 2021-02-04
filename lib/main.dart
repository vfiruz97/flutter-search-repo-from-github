import 'package:flutter/material.dart';
import 'package:search_from_github_repo/presentension/screens/result_screen.dart';
import 'package:search_from_github_repo/presentension/screens/search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search from Github Repo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      routes: {
        '/': (context) => SearchScreen(),
        '/result': (context) => ResultScreen(
              arguments: ModalRoute.of(context).settings.arguments,
            ),
      },
    );
  }
}
