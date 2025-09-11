import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/features/favorites/data/repository/favorites_repository.dart';
import '../../../../core/network/auth_api/shared_pref_network.dart';
import 'favorites_states.dart';

class FavoritesViewModel extends Cubit<FavoritesStates> {
  final FavoritesRepository favoritesRepository;

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
}
