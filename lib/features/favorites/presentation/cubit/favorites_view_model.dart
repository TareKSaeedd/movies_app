import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/favorites/data/repository/favorites_repository.dart';

import '../../../../core/network/auth_api/shared_pref_network.dart';
import '../../../../core/services/history_movie_services.dart';
import '../../../movie_details_screen/data/model/movie_details_response.dart';
import 'favorites_states.dart';

class FavoritesViewModel extends Cubit<FavoritesStates> {
  final FavoritesRepository favoritesRepository;
  final HistoryMovieServices historyMovieServices=HistoryMovieServices();
  bool isClicked=false;

  FavoritesViewModel({required this.favoritesRepository})
    : super(FavoritesInitialState());

  Future<void> getAllFavorites() async {
    emit(FavoritesLoadingState());
    try {
      String? token = await SharedPrefNetwork.getCurrentUserToken();
      await Future.delayed(Duration(seconds: 1));

      final movies = await favoritesRepository.getAllFavorites(token: token!);



      emit(FavoritesSuccessState(movies: movies));
    } catch (e) {
      emit(FavoritesErrorState(message: e.toString()));
    }
  }
  Future<void> addMovieToFavorite({required Movie movie}) async{
    isClicked = !isClicked;

    try{
      await favoritesRepository.addMovieToFavorites(movie: movie);
      historyMovieServices.addMovieToHistory(movie); //mohmoud lly 3aml l function d to save movie on sharedpref

      emit(AddedToFavoriteState(movie:movie,isClicked:isClicked ));
    }catch(e){
      emit(FavoritesErrorState(message: e.toString()));
    }

  }


}
