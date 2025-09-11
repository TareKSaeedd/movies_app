import 'package:movies_app/core/network/movies_api/movies_api_manager.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';

import '../browse_remote_data_source.dart';


class BrowseRemoteDataSourceImpl implements BrowseRemoteDataSource {
  final MoviesApiManager apiManager;

  BrowseRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<MovieResponse?> getMoviesByGenre(String genre) async {
    try {
      final response = await apiManager.getMoviesByGenre(genre);
      return response;
    } catch (e) {
      return MovieResponse(
          status: "error", statusMessage: e.toString(), data: null);
    }
  }

  @override
  Future<List<String>> getGenres() async {
    try {
      final genres = await apiManager.getGenres();
      return genres;
    } catch (e) {
      return [];
    }
  }
}
