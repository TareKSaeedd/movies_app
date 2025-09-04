import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/features/details_screen/presentation/widgets/cast_card.dart';
import 'package:movies_app/features/details_screen/presentation/widgets/count_card.dart';
import 'package:movies_app/features/details_screen/presentation/widgets/genres_card.dart';
import 'package:movies_app/features/details_screen/presentation/widgets/movie_card.dart';
import 'package:movies_app/features/details_screen/presentation/widgets/screen_shots_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Image.asset(AppAssets.movie, fit: BoxFit.cover),
              Container(
                width: width,
                height: height * 0.7,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.blackColor.withOpacity(0.0),
                      AppColors.blackColor.withOpacity(1.0),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: height * 0.03,
                  left: width * 0.03,
                  right: width * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            // back
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // save movie
                          },
                          icon: Image.asset(AppAssets.saveYellowIcon),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.18),
                    Center(
                      child: Image.asset(
                        AppAssets.playImage,
                        width: width * 0.2,
                      ),
                    ),
                    SizedBox(height: height * 0.2),

                    Text(
                      'Doctor Strange in the Multiverse of Madness',
                      style: AppStyles.robotoBold24White.copyWith(
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.02),
                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        '2022',
                        style: AppStyles.robotoBold20White.copyWith(
                          decoration: TextDecoration.none,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    CustomElevatedButton(
                      onPressed: () {
                        //watch Button
                      },
                      buttonContent: Text(
                        'Watch',
                        style: AppStyles.robotoBold20White,
                      ),
                      backgroundColor: AppColors.redColor,
                      borderSideColor: AppColors.redColor,
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CountCard(icon: AppAssets.favoriteIcon, text: '15'),
                        CountCard(icon: AppAssets.watchIcon, text: '90'),
                        CountCard(icon: AppAssets.rateIcon, text: '7.6'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          //Screen Shots

          SizedBox(height: height * 0.03),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Screen Shots',
                  style: AppStyles.robotoBold24White.copyWith(
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: height * 0.02),
                ScreenShotsWidget(screenShot: AppAssets.screenShot1),
                SizedBox(height: height * 0.015),
                ScreenShotsWidget(screenShot: AppAssets.screenShot3),
                SizedBox(height: height * 0.015),
                ScreenShotsWidget(screenShot: AppAssets.screenShot2),
                SizedBox(height: height * 0.03),

                // similler
                Text(
                  'Similler',
                  style: AppStyles.robotoBold24White.copyWith(
                    decoration: TextDecoration.none,
                  ),
                ),
                

                GridView.builder(
                  padding: EdgeInsets.only(top: height * 0.01),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    return MovieCard();
                  },
                ),
                SizedBox(height: height * 0.02),
                //Summary
          Text(
            'Summary',
            style: AppStyles.robotoBold24White.copyWith(
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346',
            style: AppStyles.robotoRegular16White.copyWith(
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: height * 0.02),

          //Cast
          Text(
            'Cast',
            style: AppStyles.robotoBold24White.copyWith(
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: height * 0.01),
          CastCard(
            image: AppAssets.actor,
            name: 'Hayley Atwell',
            charector: 'Captain Carter',
          ),
          SizedBox(height: height * 0.01),
          CastCard(
            image: AppAssets.actor,
            name: 'Hayley Atwell',
            charector: 'Captain Carter',
          ),
          SizedBox(height: height * 0.01),
          CastCard(
            image: AppAssets.actor,
            name: 'Hayley Atwell',
            charector: 'Captain Carter',
          ),
          SizedBox(height: height * 0.01),
          CastCard(
            image: AppAssets.actor,
            name: 'Hayley Atwell',
            charector: 'Captain Carter',
          ),
          SizedBox(height: height * 0.02),

          //Genres
          Text(
            'Genres',
            style: AppStyles.robotoBold24White.copyWith(
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: height * 0.01),

          GridView.builder(
                  padding: EdgeInsets.only(top: height * 0.01),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 3,
                  ),
                  itemBuilder: (context, index) {
                    return GenresCard(genre: 'Action');
                  },
                ),
                SizedBox(height: height * 0.07,)
          
              ],
            ),
          ),

          
        ],
      ),
    );
  }
}
