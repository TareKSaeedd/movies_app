import 'package:movies_app/core/network/favorites_api/favorites_api_manger.dart';
import 'package:movies_app/features/favorites/data/data_source/favorites_data_source.dart';
import 'package:movies_app/features/favorites/data/model/favorites_model.dart';

class FavoritesDataSourceImpl implements FavoritesDataSource {
  FavoritesApiManager apiManager;
  FavoritesDataSourceImpl({required this.apiManager});

  @override
  Future<List<FavoritesModel>> getAllFavorites({required String token}) {
    // TODO: implement getAllFavorites

    return apiManager.getAllFavorites(token: token);
  }
}
