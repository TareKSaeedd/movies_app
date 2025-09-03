import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/features/home/data/model/movie_details_response.dart';
import '../../../../../../core/network/movie_details_api/api_manager.dart';
import '../../../../../../core/widgets/custom_elevated_button.dart';

class MovieDetailsTab extends StatefulWidget {
  final int movieId;

  const MovieDetailsTab({super.key, required this.movieId});

  @override
  State<MovieDetailsTab> createState() => _MovieDetailsTabState();
}

class _MovieDetailsTabState extends State<MovieDetailsTab> {
  late Future<MovieDetailsResponse> _future;

  @override
  void initState() {
    super.initState();
    _future = MovieDetailsApiManager().getMovieDetails(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return FutureBuilder<MovieDetailsResponse>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.yellowColor),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error: ${snapshot.error}",
              style: AppStyles.robotoRegular16red,
            ),
          );
        }

        final result = snapshot.data;
        if (result == null || result.status != "ok" || result.movie == null) {
          return Center(
            child: Text(
              result?.statusMessage ?? "No movie details",
              style: AppStyles.robotoRegular16red,
            ),
          );
        }

        final movie = result.movie!;

        return SingleChildScrollView(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(width * 0.03),
                    child: Image.network(
                      movie.largeCoverImage ?? "",
                      width: width,
                      height: height * 0.70,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Container(
                    width: width,
                    height: height * 0.70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.03),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [AppColors.blackColor, AppColors.transparent],
                      ),
                    ),
                  ),
                  Image.asset(AppAssets.startIcon, width: width * 0.3),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(AppAssets.backArrowIcon),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(AppAssets.saveIcon),
                    ),
                  ),
                  Positioned(
                    bottom: 120,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        movie.title ?? '',
                        style: AppStyles.robotoBold24White,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 90,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        "${movie.year ?? ''}",
                        style: AppStyles.robotoBold20Gray,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: CustomElevatedButton(
                          onPressed: () {},
                          buttonContent: Text(
                            "Watch",
                            style: AppStyles.robotoBold20White,
                          ),
                          backgroundColor: AppColors.redColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width*0.07, vertical: 0.07),
                    decoration: BoxDecoration(
                      color: AppColors.darkGreyColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(AppAssets.favoriteIcon),
                  ),
                  Image.asset(AppAssets.watchIcon),
                  Image.asset(AppAssets.starIcon),
                ],
              ),
              SizedBox(height: height * 0.02),

              Text(
                movie.descriptionFull ?? "No description available.",
                style: AppStyles.robotoRegular14White,
              ),

              SizedBox(height: height * 0.03),
              Text("Screen Shots", style: AppStyles.robotoBold36White),
              SizedBox(height: height * 0.015),

              SizedBox(
                height: height * 0.15,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  separatorBuilder: (_, __) => SizedBox(width: 12),
                  itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      movie.backgroundImageOriginal ??
                          movie.mediumCoverImage ??
                          '',
                      width: width * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIconStat(IconData icon, String value) {
    return Column(
      children: [
        Icon(icon, color: AppColors.yellowColor),
        const SizedBox(height: 4),
        Text(value, style: AppStyles.robotoRegular14White),
      ],
    );
  }
}
