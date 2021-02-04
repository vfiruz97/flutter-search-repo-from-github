import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_from_github_repo/data/models/arg.dart';
import 'package:search_from_github_repo/data/models/repo.dart';
import 'package:search_from_github_repo/logic/bloc/search_repo_bloc/search_repo_bloc.dart';

class ResultScreen extends StatefulWidget {
  final Arguments arguments;
  ResultScreen({this.arguments});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<SearchRepoBloc>()
        .add(SearchRepoFetchEvent(searchText: widget.arguments.searchText));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('РЕЗУЛЬТАТ ПОИСКА'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 1.0,
      ),
      body: _body(),
    );
  }

  _body() {
    return BlocBuilder<SearchRepoBloc, SearchRepoState>(
      builder: (context, state) {
        if (state is SearchRepoLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is SearchRepoEmpty) {
          return Center(child: Text("Ничего не нашли!"));
        }

        if (state is SearchRepoLoaded) {
          print(state.repos[0].updatedAt);
          

          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _titleWidget(state.repos.length),
                SizedBox(
                  height: 15.0,
                ),
                for (Repository repo in state.repos) _cardWidget(repo),
              ],
            ),
          );
        }

        if (state is SearchRepoError) {
          return Center(child: Text("Произашло ошибка!"));
        }

        return Center(child: Text("Произашло ошибка!"));
      },
    );
  }

  Container _titleWidget(countItem) {
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'ПО ЗАПРОСУ: ',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
          children: <TextSpan>[
            TextSpan(
              text: '\"${widget.arguments.searchText}\"'.toUpperCase(),
              style: TextStyle(
                color: Colors.blueAccent,
              ),
            ),
            TextSpan(
              text: '\nНАЙДЕНО: $countItem',
              style: TextStyle(
                height: 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _cardWidget(repo) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${repo.name}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.grey[300]),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_border,
                      color: Theme.of(context).primaryColor,
                      size: 14.0,
                    ),
                    Text(
                      "${repo.stargazersCount}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage("${repo.avatarUrl}"),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "${repo.login}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(
            height: 10.0,
          ),
          Row(
            children: [
              Text(
                "Обновлено:  ",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                "${repo.updatedAt}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
