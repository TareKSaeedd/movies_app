import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';

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

  static List<OnboardingModel> pages(BuildContext context) => [
    OnboardingModel(
      imagePath: AppAssets.onboarding1,
      title: AppLocalizations.of(context)!.onboarding_title_1,
      description:
      AppLocalizations.of(context)!.onboarding_desc_1,
      gradientColors: [Colors.transparent, Colors.black],
    ),
    OnboardingModel(
      imagePath: AppAssets.onboarding2,
      title: AppLocalizations.of(context)!.onboarding_title_2,
      description:
      AppLocalizations.of(context)!.onboarding_desc_2,
      gradientColors: [Colors.transparent, AppColors.darkBlue],
    ),
    OnboardingModel(
      imagePath: AppAssets.onboarding3,
      title: AppLocalizations.of(context)!.onboarding_title_3,
      description:
      AppLocalizations.of(context)!.onboarding_desc_3,
      gradientColors: [Colors.transparent, AppColors.brown],
    ),
    OnboardingModel(
      imagePath: AppAssets.onboarding4,
      title:  AppLocalizations.of(context)!.onboarding_title_4,
      description:
      AppLocalizations.of(context)!.onboarding_desc_4,
      gradientColors: [Colors.transparent, AppColors.purple],
    ),
    OnboardingModel(
      imagePath: AppAssets.onboarding5,
      title: AppLocalizations.of(context)!.onboarding_title_5,
      description:
      AppLocalizations.of(context)!.onboarding_desc_5,
      gradientColors: [Colors.transparent, AppColors.darkRed],
    ),
    OnboardingModel(
      imagePath: AppAssets.onboarding6,
      title: AppLocalizations.of(context)!.onboarding_title_6,
      gradientColors: [Colors.transparent, AppColors.darkGrey],
    ),
  ];
}
