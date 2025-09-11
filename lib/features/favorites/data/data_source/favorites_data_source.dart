
import '../model/favorites_model.dart';

abstract class FavoritesDataSource {
  Future<List<FavoritesModel>> getAllFavorites({required String token});
}
