import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:search_from_github_repo/data/models/repo.dart';

class SearchRepository {
  static final String baseSearchUrl =
      "https://api.github.com/search/repositories";

  Future searchGithub(String search) async {
    List<Repository> repos = [];
    String url = "${SearchRepository.baseSearchUrl}?q=$search";

    try {
      var data = await http.get(url, headers: {
        'Accept': 'application/vnd.github.v3+json',
      });

      if (data.statusCode == 200) {
        Map repoMap = jsonDecode(data.body);

        if (repoMap['items'].length > 0) {
          List items = repoMap['items'];
          repos = items.map((item) => Repository.fromJson(item)).toList();
        }
        return repos;
      } else {
        return "Ошибка: Что-то пошло не так!";
      }
    } catch (e) {
      return "Ошибка:" + e.toString();
    }
  }
}
