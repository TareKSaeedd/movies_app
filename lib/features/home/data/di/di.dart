import 'package:movies_app/core/network/movies_api/movies_api_manager.dart';
import 'package:movies_app/features/home/data/data_source/local/history_movies_local_data_source.dart';
import 'package:movies_app/features/home/data/data_source/remote/impl/movies_remote_data_source_impl.dart';
import 'package:movies_app/features/home/data/data_source/remote/impl/search_remote_data_source_impl.dart';
import 'package:movies_app/features/home/data/data_source/remote/movies_remote_data_source.dart';
import 'package:movies_app/features/home/data/data_source/remote/search_remote_data_source.dart';
import 'package:movies_app/features/home/data/repository/home_tab_repository.dart';
import 'package:movies_app/features/home/data/repository/impl/home_tab_repository_impl.dart';
import 'package:movies_app/features/home/data/repository/impl/search_tab_repository_impl.dart';
import 'package:movies_app/features/home/data/repository/search_tab_repository.dart';
import 'package:movies_app/features/movie_details_screen/data/data_source/remote/impl/movie_details_remote_data_source_impl.dart';
import 'package:movies_app/features/movie_details_screen/data/data_source/remote/movie_details_remote_data_source.dart';
import 'package:movies_app/features/movie_details_screen/data/repository/impl/movie_details_repository_impl.dart';
import 'package:movies_app/features/movie_details_screen/data/repository/movie_details_repository.dart';

import '../../../../core/services/history_movie_services.dart';
import '../../../favorites/data/di/favorites_di.dart';
import '../../../favorites/data/repository/favorites_repository.dart';
import '../../../favorites/data/repository/favorites_repository_impl.dart';
import '../data_source/local/impl/history_movies_local_data_source_impl.dart';
import '../data_source/remote/browse_remote_data_source.dart';
import '../data_source/remote/impl/browse_remote_data_source_impl.dart';
import '../repository/browse_tab_repository.dart';
import '../repository/history_repository.dart';
import '../repository/impl/browse_tab_repository_impl.dart';
import '../repository/impl/history_repository_imp;.dart';

//todo:HomeTabViewModel => object MoviesRepository
//todo:MoviesRepository=> object MoviesRemoteDataSource
//todo:MoviesRemoteDataSource=> object Api manager

HomeTabRepository injectMoviesRepository() {
  return MoviesRepositoryImpl(remoteDataSource: injectMoviesRemoteDataSource());
}

MoviesRemoteDataSource injectMoviesRemoteDataSource() {
  return MoviesRemoteDataSourceImpl(apiManager: injectApiManager());
}

MoviesApiManager injectApiManager() {
  return MoviesApiManager();
}

SearchTabRepository injectSearchTabRepository() {
  return SearchTabRepositoryImpl(searchRemoteDataSource: injectSearchRemoteDataSource());
}

SearchRemoteDataSource injectSearchRemoteDataSource() {
  return SearchRemoteDataSourceImpl(apiManager: injectApiManager());
}

MovieDetailsRepository injectMovieDetailsRepository() {
  return MovieDetailsRepositoryImpl(
    movieDetailsRemoteDatasource: injectMovieDetailsRemoteDataSOurce(),
  );
}

MovieDetailsRemoteDatasource injectMovieDetailsRemoteDataSOurce() {
  return MovieDetailsRemoteDataSourceImpl(apiManager: injectApiManager());
}


BrowseTabRepository injectBrowseTabRepository() {
  return BrowseTabRepositoryImpl(
    remoteDataSource: injectBrowseRemoteDataSource(),
  );
}

BrowseRemoteDataSource injectBrowseRemoteDataSource() {
  return BrowseRemoteDataSourceImpl(apiManager: injectApiManager());
}

HistoryRepository injectHistoryRepository(){
  return HistoryRepositoryImpl(localDs: injectHistoryMoviesLocalDs());
}


HistoryMoviesLocalDataSource injectHistoryMoviesLocalDs(){
  return HistoryMoviesLocalDataSourceImpl(services: injectHistoryMovieServices());

}

HistoryMovieServices injectHistoryMovieServices(){
  return HistoryMovieServices();

}
FavoritesRepository injectFavoritesRepository(){
  return FavoritesRepositoryImpl(
    favoritesDataSource: injectFavoritesDataSource(),
  );
}
