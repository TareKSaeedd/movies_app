import 'package:movies_app/features/movie_details_screen/data/model/movie_details_response.dart';

abstract class HistoryStates {}

class HistoryInitialState extends HistoryStates {}

class HistoryLoadingState extends HistoryStates {}

class HistorySuccessState extends HistoryStates {
  final List<Movie> movies;
  HistorySuccessState({required this.movies});
}

class HistoryErrorState extends HistoryStates {
  final String message;
  HistoryErrorState({required this.message});
}
