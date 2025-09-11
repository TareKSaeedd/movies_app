import 'package:movies_app/features/home/data/model/movie_response.dart';

abstract class BrowseTabState {}

class BrowseInitialState extends BrowseTabState {}

class BrowseLoadingState extends BrowseTabState {}

class BrowseErrorState extends BrowseTabState {
  final String errorMessage;

  BrowseErrorState({required this.errorMessage});
}

class BrowseSuccessState extends BrowseTabState {
  final List<String> genres;
  final List<Movies?> movies;
  final int selectedIndex;

  BrowseSuccessState({
    required this.genres,
    required this.movies,
    required this.selectedIndex,
  });
}
