import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:search_from_github_repo/data/models/repo.dart';
import 'package:search_from_github_repo/data/repositories/search_repository.dart';

part 'search_repo_event.dart';
part 'search_repo_state.dart';

class SearchRepoBloc extends Bloc<SearchRepoEvent, SearchRepoState> {
  final SearchRepository searchRepo;
  SearchRepoBloc({this.searchRepo}) : super(SearchRepoLoading());

  @override
  Stream<SearchRepoState> mapEventToState(SearchRepoEvent event) async* {
    if (event is SearchRepoFetchEvent) {
      yield SearchRepoLoading();

      var repos = await searchRepo.searchGithub(event.searchText);

      if (repos is List<Repository>) {
        if (repos.length > 0) {
          yield SearchRepoLoaded(repos: repos);
        } else {
          yield SearchRepoEmpty();
        }
      } else {
        yield SearchRepoError();
      }
    } else {
      yield SearchRepoError();
    }
  }
}
