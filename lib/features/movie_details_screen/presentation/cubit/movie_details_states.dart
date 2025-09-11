import 'package:movies_app/features/movie_details_screen/data/model/movie_details_response.dart';

abstract class MovieDetailsStates {}

class MovieDetailsInitialState extends MovieDetailsStates {}

class MovieDetailsLoadingState extends MovieDetailsStates {}

class MovieDetailsErrorState extends MovieDetailsStates {
  String message;
  MovieDetailsErrorState({required this.message});
}

class MovieDetailsSuccessState extends MovieDetailsStates {
  Movie movieDetails;
  final bool isClicked;

  MovieDetailsSuccessState({required this.movieDetails,this.isClicked=false});
}
