import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/di/di.dart';
import 'package:movies_app/features/home/presentation/cubit/home/cubit/home_tab_states.dart';
import 'package:movies_app/features/home/presentation/cubit/home/cubit/home_tab_view_model.dart';
import 'package:movies_app/features/home/presentation/pages/tabs/home_tab/widgets/movie_item.dart';
import 'package:movies_app/features/home/model/movie_response.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<Movies> moviesList = [];
  final ScrollController _listController = ScrollController();

  HomeTabViewModel viewModel = HomeTabViewModel(moviesRepository: injectMoviesRepository());
  @override
  void initState() {
    super.initState();
    viewModel.getMovies();
  }

  /*
  width:430
  height:932
  */
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is HomeTabLoadingState) {
          return Center(child: CircularProgressIndicator(color: AppColors.darkGreyColor));
        } else if (state is HomeTabErrorState) {
          return Center(child: Text('Something Went Wrong: ${state.errorMessage}'));
        } else if (state is HomeTabSuccessState) {
          if (state.moviesList.isEmpty) {
            return const Center(child: Text("No movies found"));
          }
          return Scaffold(
            backgroundColor: AppColors.blackColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      generateCachedNetworkImage(
                        imageUrl: state.moviesList[state.selectedIndex]?.largeCoverImage! ?? '',
                        key: ValueKey(state.selectedIndex),
                        width: width,
                        height: height * 0.69,
                      ),
                      Container(
                        height: height * 0.69,
                        width: width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.007,
                        left: width * 0.18,
                        child: Image.asset(AppAssets.availableNow),
                      ),
                      Positioned(
                        bottom: height * 0.006,
                        left: width * 0.08,
                        child: Image.asset(AppAssets.watchNow),
                      ),
                      Positioned(
                        top: height * 0.12,
                        left: 0,
                        right: 0,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: height * 0.376,
                            enlargeCenterPage: true,
                            viewportFraction: 0.55,
                            autoPlay: false,
                            onPageChanged: (index, reason) {
                              viewModel.changeSelectedIndex(
                                index: index,
                                moviesList: state.moviesList,
                              );
                            },
                          ),
                          items: state.moviesList.map((movie) {
                            return Builder(
                              builder: (context) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: generateCachedNetworkImage(
                                          key: ValueKey(state.selectedIndex),
                                          imageUrl: movie!.mediumCoverImage!,
                                          width: width * 0.54,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Positioned(
                        top: height * 0.14,
                        left: width * 0.26,
                        child: generateRatingWidget(
                          width,
                          height,
                          state.moviesList[state.selectedIndex]!.rating.toString(),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: height * 0.01),
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Row(
                      children: [
                        Text(
                          'Action',
                          style: AppStyles.robotoRegular20White.copyWith(
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'See More',
                          style: AppStyles.robotoRegular16Yellow.copyWith(
                            decoration: TextDecoration.none,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _listController.animateTo(
                              _listController.offset + (width * 0.36),
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Icon(Icons.arrow_forward, color: AppColors.yellowColor),
                        ),
                      ],
                    ),
                  ),
                  MovieItem(
                    key: ValueKey(state.moviesList[state.selectedIndex]!.mediumCoverImage ?? ''),
                    itemCount: state.moviesList.length,
                    controller: _listController,
                    moviesList: state.moviesList,
                    width: width,
                    height: height,
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

Widget generateRatingWidget(double width, double height, String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.001),
    decoration: BoxDecoration(
      color: AppColors.darkGreyColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text, style: AppStyles.robotoRegular16White),
        Icon(Icons.star, color: AppColors.yellowColor),
      ],
    ),
  );
}

CachedNetworkImage generateCachedNetworkImage({
  required ValueKey key,
  required String imageUrl,
  double? width,
  double? height,
}) {
  return CachedNetworkImage(
    key: key,
    imageUrl: imageUrl,
    fit: BoxFit.fill,
    width: width,
    height: height,
    placeholder: (context, url) =>
        Center(child: CircularProgressIndicator(color: AppColors.darkGreyColor)),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
