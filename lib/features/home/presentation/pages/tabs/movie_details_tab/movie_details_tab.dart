import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/features/home/presentation/pages/tabs/movie_details_tab/widgets/info_item.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/widgets/custom_elevated_button.dart';

class MovieDetailsTab extends StatelessWidget {
  const MovieDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;

    final List<String> screenShots = [
      AppAssets.screenShot1,
      AppAssets.screenShot2,
      AppAssets.screenShot3,
    ];


    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  AppAssets.detailsImage,
                  fit: BoxFit.cover,
                  width: width,
                  height: height * 0.70,
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
              Image.asset(AppAssets.startIcon),
              Positioned(
                top: 25,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(AppAssets.backArrowIcon),
                ),
              ),
              Positioned(
                top: 25,
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
                child: Text(
                  "Doctor Strange in the Multiverse of Madness",
                  style: AppStyles.robotoBold24White,
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                bottom: 80,
                left: 0,
                right: 0,
                child: Text(
                  "2022",
                  style: AppStyles.robotoBold20Grey,
                  textAlign: TextAlign.center,
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
              InfoItem(iconPath: AppAssets.favoriteIcon, value: "15"),
              InfoItem(iconPath: AppAssets.watchIcon, value: "90"),
              InfoItem(iconPath: AppAssets.starIcon, value: "7.6"),
            ],
          ),
          SizedBox(height: height * 0.03),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Text("Screen Shots", style: AppStyles.robotoBold24White),
          ),
          SizedBox(height: height * 0.02),
          Container(
            height: height * 0.25,
            width: width,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: screenShots.length,
              separatorBuilder: (context, index) =>
                  Container(height: height * 0.03),
              itemBuilder: (context, index) {
                return Container(
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      screenShots[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}