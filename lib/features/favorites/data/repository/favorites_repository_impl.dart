

import 'package:movies_app/features/favorites/data/model/favorites_model.dart';
import 'package:movies_app/features/movie_details_screen/data/model/movie_details_response.dart';

import '../data_source/favorites_data_source.dart';
import 'favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesDataSource favoritesDataSource;
  FavoritesRepositoryImpl({required this.favoritesDataSource});
  @override
  Future<List<FavoritesModel>> getAllFavorites({required String token}) {
    // TODO: implement getAllFavorites
    return favoritesDataSource.getAllFavorites(token: token);
  }

  @override
  Future<void> addMovieToFavorites({required Movie movie}) {
   return favoritesDataSource.addMovieToFavorites(movie: movie);
  }

}