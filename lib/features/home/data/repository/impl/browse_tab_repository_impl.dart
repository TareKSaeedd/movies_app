import 'package:movies_app/features/home/data/model/movie_response.dart';

import '../../data_source/remote/browse_remote_data_source.dart';
import '../browse_tab_repository.dart';

class BrowseTabRepositoryImpl implements BrowseTabRepository {
  final BrowseRemoteDataSource remoteDataSource;

  BrowseTabRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<String>> getGenres() async {
    return remoteDataSource.getGenres();
  }

  @override
  Future<List<Movies?>> getMoviesByGenre(String genre) async {
    final response = await remoteDataSource.getMoviesByGenre(genre);
    return response?.data?.movies ?? [];
  }
}
