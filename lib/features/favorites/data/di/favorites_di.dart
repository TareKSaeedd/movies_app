
import 'package:movies_app/core/network/favorites_api/favorites_api_manger.dart';
import 'package:movies_app/features/favorites/data/data_source/favorites_data_source.dart';

import '../data_source/favorites_data_source_impl.dart';
import '../repository/favorites_repository.dart';
import '../repository/favorites_repository_impl.dart';

FavoritesRepository injectFavoritesRepository() {
  return FavoritesRepositoryImpl(favoritesDataSource: injectFavoritesDataSource());
}

FavoritesDataSource injectFavoritesDataSource() {
  return FavoritesDataSourceImpl(apiManager: injectFavoritesApiManger());
}

FavoritesApiManager injectFavoritesApiManger() {
  return FavoritesApiManager();
}