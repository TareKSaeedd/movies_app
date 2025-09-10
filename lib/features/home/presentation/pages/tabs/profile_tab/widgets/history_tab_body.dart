import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/features/home/presentation/pages/tabs/profile_tab/cubit/history_cubit.dart';
import 'package:movies_app/features/home/presentation/pages/tabs/profile_tab/cubit/history_states.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../data/di/di.dart';
import 'history_movies_grid.dart';

class HistoryTabBody extends StatelessWidget {
  HistoryTabBody({super.key});

  final HistoryCubit historyCubit = HistoryCubit(
    historyRepository: injectHistoryRepository(),
  );

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HistoryCubit, HistoryStates>(
      bloc: historyCubit..loadHistory(),
      builder: (context, state) {
        if (state is HistoryLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HistoryErrorState) {
          return Center(
            child: Text(state.message, style: AppStyles.robotoRegular16Yellow),
          );
        } else if (state is HistorySuccessState) {
          final movies = state.movies;
          if (movies.isEmpty) {
            return _emptyMoviesWidget();
          }
          return HistoryMoviesGrid(movies: movies);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

Widget _emptyMoviesWidget() => Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Image.asset(AppAssets.nonSearchTabIcon),
    SizedBox(
      height: 10,
    ),
    Text("No History Found", style: AppStyles.robotoRegular16Yellow),
  ],
);
