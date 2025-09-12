import 'package:movies_app/features/favorites/data/model/add_to_favorites_response.dart';
import 'package:movies_app/features/favorites/data/model/favorites_model.dart';

abstract class FavoritesStates {}

class FavoritesInitialState extends FavoritesStates {}

class FavoritesLoadingState extends FavoritesStates {}

class FavoritesSuccessState extends FavoritesStates {
  final List<FavoritesModel> movies;
  FavoritesSuccessState({required this.movies});
}

class AddToFavoritesState extends FavoritesStates {
  final AddToFavoritesResponse response;
  final bool isFavorite;
  AddToFavoritesState({required this.response, required this.isFavorite});
}

class FavoritesErrorState extends FavoritesStates {
  final String message;
  FavoritesErrorState({required this.message});
}

class FavoritesCheckState extends FavoritesStates {
  final bool isFavorite;
  FavoritesCheckState({required this.isFavorite});
}

class FavoritesDeleteState extends FavoritesStates {
  final String message;
  FavoritesDeleteState({this.message = "Movie deleted successfully"});
}
