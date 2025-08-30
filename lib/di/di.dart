import 'package:movies_app/core/network/movies_api/api_manager.dart';
import 'package:movies_app/features/home/data/data_source/remote/impl/movies_remote_data_source_impl.dart';
import 'package:movies_app/features/home/data/data_source/remote/movies_remote_data_source.dart';
import 'package:movies_app/features/home/data/repository/impl/home_tab_repository_impl.dart';
import 'package:movies_app/features/home/data/repository/home_tab_repository.dart';
//todo:HomeTabViewModel => object MoviesRepository
//todo:MoviesRepository=> object MoviesRemoteDataSource
//todo:MoviesRemoteDataSource=> object Api manager

HomeTabRepository injectMoviesRepository() {
  return MoviesRepositoryImpl(remoteDataSource: injectMoviesRemoteDataSource());
}

MoviesRemoteDataSource injectMoviesRemoteDataSource() {
  return MoviesRemoteDataSourceImpl(apiManager: injectApiManager());
}

ApiManager injectApiManager() {
  return ApiManager();
}
