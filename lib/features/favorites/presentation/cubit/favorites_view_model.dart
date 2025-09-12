import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/features/favorites/data/repository/favorites_repository.dart';
import '../../../../core/network/auth_api/shared_pref_network.dart';
import 'favorites_states.dart';

class FavoritesViewModel extends Cubit<FavoritesStates> {
  final FavoritesRepository favoritesRepository;
  bool isFav = false;
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
   Future<void> deleteFavorite(String movieId) async {
  emit(FavoritesLoadingState());
  try {
    String? token = await SharedPrefNetwork.getCurrentUserToken();
    await favoritesRepository.deleteFavorite(token: token!, movieId: movieId);

    emit(FavoritesDeleteState());
  } catch (e) {
    emit(FavoritesErrorState(message: e.toString()));
  }
}

Future<void> checkIsFavorite(String movieId) async {
  try {
    String? token = await SharedPrefNetwork.getCurrentUserToken();
      isFav = await favoritesRepository.checkIsFavorite(
      token: token!,
      movieId: movieId,
    );
    emit(FavoritesCheckState(isFavorite: isFav));
  } catch (e) {
    emit(FavoritesErrorState(message: e.toString()));
  }
}
}
