

import 'package:movies_app/features/favorites/data/model/favorites_model.dart';

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

}