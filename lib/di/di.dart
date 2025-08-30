import 'package:movies_app/movies_api/api_manager.dart';
import 'package:movies_app/data/repository/movies/data_sources/remote/impl/movies_remote_data_source_impl.dart';
import 'package:movies_app/data/repository/movies/data_sources/remote/movies_remote_data_source.dart';
import 'package:movies_app/data/repository/movies/repository/impl/home_tab_repository_impl.dart';
import 'package:movies_app/data/repository/movies/repository/home_tab_repository.dart';
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
