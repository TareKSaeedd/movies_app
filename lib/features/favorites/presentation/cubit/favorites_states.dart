import 'package:movies_app/features/favorites/data/model/favorites_model.dart';

import '../../../movie_details_screen/data/model/movie_details_response.dart';

abstract class FavoritesStates {}

class FavoritesInitialState extends FavoritesStates {}

class FavoritesLoadingState extends FavoritesStates {}

class FavoritesSuccessState extends FavoritesStates {
  final List<FavoritesModel> movies;
  FavoritesSuccessState({required this.movies});
}

class FavoritesErrorState extends FavoritesStates {
  final String message;
  FavoritesErrorState({required this.message});
}

class AddedToFavoriteState extends FavoritesStates {
  final Movie movie;
  final bool isClicked;
  AddedToFavoriteState({required this.movie,required this.isClicked});
}

