import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/data/repository/history_repository.dart';

import 'history_states.dart';

class HistoryCubit extends Cubit<HistoryStates> {
  final HistoryRepository historyRepository;

  HistoryCubit({required this.historyRepository}) : super(HistoryInitialState());

  Future<void> loadHistory() async {
    emit(HistoryLoadingState());
    try {
      final movies = await historyRepository.getHistory();

      if (movies.isEmpty) {
        emit(HistorySuccessState(movies: []));
      } else {
        emit(HistorySuccessState(movies: movies));
      }

    } catch (e) {
      emit(HistoryErrorState(message: e.toString()));
    }
  }
}
