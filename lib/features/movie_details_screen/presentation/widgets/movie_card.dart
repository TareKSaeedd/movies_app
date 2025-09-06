import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/features/home/data/di/di.dart';
import 'package:movies_app/features/movie_details_screen/presentation/cubit/movie_suggestion_states.dart';
import 'package:movies_app/features/movie_details_screen/presentation/cubit/movie_suggestion_view_model.dart';

class MovieCard extends StatefulWidget {
  final int index;
  final int movieId;

  const MovieCard({super.key, required this.index, required this.movieId});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  MovieSuggestionViewModel viewModel = MovieSuggestionViewModel(
    movieDetailsRepository: injectMovieDetailsRepository(),
  );

  @override
  void initState() {
    viewModel.getMoviesSuggestions(widget.movieId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<MovieSuggestionViewModel, MovieSuggestionStates>(
        builder: (context, state) {
          if (state is MovieSuggestionSuccessState) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        state.suggestionMovies![widget.index].mediumCoverImage ??
                        'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator(color: AppColors.yellowColor)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),

                  Positioned(
                    top: sizeScreen.height * 0.01,
                    left: sizeScreen.width * 0.02,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: sizeScreen.width * 0.015,
                        vertical: sizeScreen.height * 0.005,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '${state.suggestionMovies![widget.index].rating}',
                            style: AppStyles.robotoMedium15White.copyWith(
                              decoration: TextDecoration.none,
                            ),
                          ),
                          SizedBox(width: sizeScreen.width * 0.01),
                          const Icon(Icons.star, color: Colors.amber, size: 14),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is MovieSuggestionErrorState) {
            return Center(child: Text(state.errorMessage, style: AppStyles.robotoRegular20White));
          } else if (state is MovieSuggestionLoadingStates) {
            return Center(child: CircularProgressIndicator(color: AppColors.darkGrey));
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
