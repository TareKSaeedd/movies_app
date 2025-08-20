import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';

class OnboardingModel {
  final String imagePath;
  final String title;
  final String? description;
  final List<Color> gradientColors;

  OnboardingModel({
    required this.imagePath,
    required this.title,
    this.description,
    required this.gradientColors,
  });

  static List<OnboardingModel> pages = [
    OnboardingModel(
      imagePath: AppAssets.onboarding1,
      title: 'Find Your Next\n Favorite Movie Here',
      description:
          'Get access to a huge library of movies to suit all tastes. You will surely like it.',
      gradientColors: [Colors.transparent, Colors.black],
    ),
    OnboardingModel(
      imagePath: AppAssets.onboarding2,
      title: 'Discover Movies',
      description:
          'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
      gradientColors: [Colors.transparent, AppColors.darkBlue],
    ),
    OnboardingModel(
      imagePath: AppAssets.onboarding3,
      title: 'Explore All Genres',
      description:
          'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
      gradientColors: [Colors.transparent, AppColors.brown],
    ),
    OnboardingModel(
      imagePath: AppAssets.onboarding4,
      title: 'Create Watchlists',
      description:
          'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
      gradientColors: [Colors.transparent, AppColors.purple],
    ),
    OnboardingModel(
      imagePath: AppAssets.onboarding5,
      title: 'Rate, Review, and Learn',
      description:
          'Share your thoughts on the movies you have watched. Dive deep into film details and help others discover great movies with your reviews.',
      gradientColors: [Colors.transparent, AppColors.darkRed],
    ),
    OnboardingModel(
      imagePath: AppAssets.onboarding6,
      title: 'Start Watching Now',
      gradientColors: [Colors.transparent, AppColors.darkGrey],
    ),
  ];
}
