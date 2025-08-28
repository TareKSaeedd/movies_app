import 'package:dio/dio.dart';
import 'package:movies_app/model/movie_response.dart';

class DioApiManager{
  
  final dio=Dio();
  Future<MovieResponse?> getMovies()async{
    try{
      var response=await dio.get('https://yts.mx/api/v2/list_movies.json');
      var json= response.data;
      return MovieResponse.fromJson(json);
    }catch(e){
      rethrow;
    }

  }

}