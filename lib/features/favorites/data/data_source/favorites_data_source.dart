import '../model/favorites_model.dart';

abstract class FavoritesDataSource {
  Future<List<FavoritesModel>> getAllFavorites({required String token});
  Future<void> deleteFavorite({required String token, required String movieId});
  Future<bool> checkIsFavorite({required String token, required String movieId});
}
