part of 'search_repo_bloc.dart';

@immutable
abstract class SearchRepoState {}

class SearchRepoLoading extends SearchRepoState {}

class SearchRepoLoaded extends SearchRepoState {
  final List<Repository> repos;
  SearchRepoLoaded({@required this.repos});
}

class SearchRepoEmpty extends SearchRepoState {}

class SearchRepoError extends SearchRepoState {}
