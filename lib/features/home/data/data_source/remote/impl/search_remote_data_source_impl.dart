import 'package:movies_app/core/network/movies_api/api_manager.dart';
import 'package:movies_app/features/home/data/data_source/remote/search_remote_data_source.dart';
import 'package:movies_app/features/home/data/model/search_response.dart';

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource{
  ApiManager apiManager;
  SearchRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<SearchResponse?> searchMovies(String? query) async{
    var response = await apiManager.searchMovies(query!);
    return response;
  }
}