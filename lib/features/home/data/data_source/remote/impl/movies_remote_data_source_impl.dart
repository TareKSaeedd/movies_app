import 'package:movies_app/core/network/movies_api/api_manager.dart';
import 'package:movies_app/features/home/data/data_source/remote/movies_remote_data_source.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  ApiManager apiManager;

  MoviesRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<MovieResponse?> getMovies() async {
    var response = await apiManager.getMovies();
    return response;
  }
}
