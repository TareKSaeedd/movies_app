import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/data/repository/search_tab_repository.dart';
import 'package:movies_app/features/home/presentation/cubit/search/search_tab_state.dart';

class SearchTabViewModel extends Cubit<SearchState> {
  final SearchTabRepository searchRepository;

  SearchTabViewModel({required this.searchRepository}) : super(SearchInitial());

  Future<void> searchMovies(String? query) async {
    try {
      emit(SearchLoading());

      final response = await searchRepository.searchMovies(query);

      final movies = response?.movies ?? [];

      emit(SearchSuccess(movies));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}