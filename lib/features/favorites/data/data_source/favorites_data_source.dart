import 'package:movies_app/features/favorites/data/model/add_to_favorites_request.dart';
import 'package:movies_app/features/favorites/data/model/add_to_favorites_response.dart';

import '../model/favorites_model.dart';

abstract class FavoritesDataSource {
  Future<List<FavoritesModel>> getAllFavorites({required String token});
  Future<void> deleteFavorite({required String token, required String movieId});
  Future<bool> checkIsFavorite({required String token, required String movieId});
  Future<AddToFavoritesResponse> addToFavorites({
    required String token,
    required AddToFavoritesRequest favoriteRequest,
  });
}
