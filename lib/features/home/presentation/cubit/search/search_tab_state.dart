import 'package:movies_app/features/home/data/model/movie_response.dart';

abstract class SearchState{}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Movies> movies;

  SearchSuccess(this.movies);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}