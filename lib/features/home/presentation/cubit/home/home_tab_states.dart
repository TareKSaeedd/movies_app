import 'package:movies_app/features/home/data/model/movie_response.dart';

abstract class HomeTabStates {}

class HomeTabLoadingState extends HomeTabStates {}

class HomeTabErrorState extends HomeTabStates {
  String errorMessage;
  HomeTabErrorState({required this.errorMessage});
}

class HomeTabSuccessState extends HomeTabStates {
  List<Movies?> moviesList;
  int selectedIndex = 0;
  HomeTabSuccessState({required this.moviesList, required this.selectedIndex});
}

