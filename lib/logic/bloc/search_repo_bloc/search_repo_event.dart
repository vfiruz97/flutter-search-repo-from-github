part of 'search_repo_bloc.dart';

@immutable
abstract class SearchRepoEvent {}

class SearchRepoFetchEvent extends SearchRepoEvent {
  final String searchText;
  SearchRepoFetchEvent({@required this.searchText});
}
