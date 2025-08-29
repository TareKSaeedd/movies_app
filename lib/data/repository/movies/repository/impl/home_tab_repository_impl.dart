import 'package:movies_app/data/repository/movies/repository/home_tab_repository.dart';
import 'package:movies_app/model/movie_response.dart';

import '../../data_sources/remote/movies_remote_data_source.dart';

class MoviesRepositoryImpl implements HomeTabRepository{
  MoviesRemoteDataSource remoteDataSource;
  MoviesRepositoryImpl({required this.remoteDataSource});
  @override
  Future<MovieResponse?> getMovies() {
  return remoteDataSource.getMovies();
  }

}