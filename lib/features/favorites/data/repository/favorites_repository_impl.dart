import 'package:movies_app/features/favorites/data/model/add_to_favorites_request.dart';
import 'package:movies_app/features/favorites/data/model/add_to_favorites_response.dart';
import 'package:movies_app/features/favorites/data/model/favorites_model.dart';

import '../data_source/favorites_data_source.dart';
import 'favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesDataSource favoritesDataSource;
  FavoritesRepositoryImpl({required this.favoritesDataSource});
  @override
  Future<List<FavoritesModel>> getAllFavorites({required String token}) {
    return favoritesDataSource.getAllFavorites(token: token);
  }

  @override
  Future<bool> checkIsFavorite({required String token, required String movieId}) {
    return favoritesDataSource.checkIsFavorite(token: token, movieId: movieId);
  }

  @override
  Future<void> deleteFavorite({required String token, required String movieId}) {
    return favoritesDataSource.deleteFavorite(token: token, movieId: movieId);
  }

  @override
  Future<AddToFavoritesResponse> addToFavorites({
    required String token,
    required AddToFavoritesRequest favoriteRequest,
  }) {
    return favoritesDataSource.addToFavorites(token: token, favoriteRequest: favoriteRequest);
  }
}
