import 'package:movies_app/features/favorites/data/model/favorites_model.dart';

abstract class FavoritesRepository {
  Future<List<FavoritesModel>> getAllFavorites({required String token});
}
