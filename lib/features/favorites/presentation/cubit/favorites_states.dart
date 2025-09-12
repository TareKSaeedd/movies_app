import 'package:movies_app/features/favorites/data/model/favorites_model.dart';

abstract class FavoritesStates {}

class FavoritesInitialState extends FavoritesStates 
{
  FavoritesInitialState(){
    print('initial###########');
  }
}

class FavoritesLoadingState extends FavoritesStates {}

class FavoritesSuccessState extends FavoritesStates {
  final List<FavoritesModel> movies;
  FavoritesSuccessState({required this.movies}){
    print('success###########');
  }
}

class FavoritesErrorState extends FavoritesStates {
  final String message;
  FavoritesErrorState({required this.message});
}

class FavoritesCheckState extends FavoritesStates{
  final bool isFavorite;
  FavoritesCheckState({required this.isFavorite}){
    print('check###########');
  }
}


class FavoritesDeleteState extends FavoritesStates {
  final String message;
  FavoritesDeleteState({this.message = "Movie deleted successfully"}){
    print('deleted###########');
  }
}