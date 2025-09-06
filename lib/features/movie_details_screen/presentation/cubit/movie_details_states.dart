import 'package:movies_app/features/movie_details_screen/data/model/movie_details_response.dart';
import 'package:movies_app/features/movie_details_screen/data/model/movie_suggestions_response.dart';

abstract class MovieDetailsStates {}

class MovieDetailsInitialState extends MovieDetailsStates {}

class MovieDetailsLoadingState extends MovieDetailsStates {}

class MovieDetailsErorrState extends MovieDetailsStates {
  String message;
  MovieDetailsErorrState({required this.message});
}

class MovieDetailsSuccessState extends MovieDetailsStates {
  Movie movieDetails;

  MovieDetailsSuccessState({required this.movieDetails});
}
