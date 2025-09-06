import 'package:movies_app/features/movie_details_screen/data/model/movie_suggestions_response.dart';

abstract class MovieSuggestionStates {}

class MovieSuggestionLoadingStates extends MovieSuggestionStates {}

class MovieSuggestionErrorState extends MovieSuggestionStates {
  String errorMessage;

  MovieSuggestionErrorState({required this.errorMessage});
}

class MovieSuggestionSuccessState extends MovieSuggestionStates {
  List<Movies>? suggestionMovies;

  MovieSuggestionSuccessState({required this.suggestionMovies});
}
