import 'package:movies_app/features/home/data/model/search_response.dart';

abstract class SearchRemoteDataSource {
  Future<SearchResponse?> searchMovies(String? query);
}