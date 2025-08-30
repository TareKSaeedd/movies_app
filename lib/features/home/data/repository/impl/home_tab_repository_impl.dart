import 'package:movies_app/features/home/data/repository/home_tab_repository.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';

import '../../data_source/remote/movies_remote_data_source.dart';

class MoviesRepositoryImpl implements HomeTabRepository {
  MoviesRemoteDataSource remoteDataSource;
  MoviesRepositoryImpl({required this.remoteDataSource});
  @override
  Future<MovieResponse?> getMovies() {
    return remoteDataSource.getMovies();
  }
}
