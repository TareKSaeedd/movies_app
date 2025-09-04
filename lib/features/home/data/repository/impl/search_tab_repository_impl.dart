import 'package:movies_app/features/home/data/data_source/remote/search_remote_data_source.dart';
import 'package:movies_app/features/home/data/model/search_response.dart';
import 'package:movies_app/features/home/data/repository/search_tab_repository.dart';

class SearchTabRepositoryImpl implements SearchTabRepository{
  SearchRemoteDataSource searchRemoteDataSource;
  SearchTabRepositoryImpl({required this.searchRemoteDataSource});
  @override
  Future<SearchResponse?> searchMovies(String? query) {
    return searchRemoteDataSource.searchMovies(query);
  }
}