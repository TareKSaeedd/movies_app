import 'package:movies_app/features/home/data/model/search_response.dart';

abstract class SearchTabRepository {
  Future<SearchResponse?> searchMovies(String? query);
}