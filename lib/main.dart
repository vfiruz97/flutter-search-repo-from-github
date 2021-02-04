import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_from_github_repo/data/repositories/search_repository.dart';
import 'package:search_from_github_repo/logic/bloc/search_repo_bloc/search_repo_bloc.dart';
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
        '/result': (context) => BlocProvider(
              create: (context) => SearchRepoBloc(
                searchRepo: SearchRepository(),
              ),
              child: ResultScreen(
                arguments: ModalRoute.of(context).settings.arguments,
              ),
            ),
      },
    );
  }
}
