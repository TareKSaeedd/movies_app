import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/core/navigation/app_routes.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/features/favorites/data/di/favorites_di.dart';
import 'package:movies_app/features/favorites/presentation/cubit/favorites_view_model.dart';
import 'package:movies_app/l10n/app_localizations.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../favorites/presentation/page/favorites_page.dart';
import 'widgets/history_tab_body.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String selectedTab = "wishlist";
  FavoritesViewModel favoritesViewModel = FavoritesViewModel(
    favoritesRepository: injectFavoritesRepository(),
  );

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => favoritesViewModel,
      child: Scaffold(
        backgroundColor: AppColors.darkGreyColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(radius: 55, backgroundImage: AssetImage(AppAssets.jackAvatar)),
                      SizedBox(height: sizeScreen.height * 0.02),
                      Text('John Safwat', style: AppStyles.robotoBold20White),
                    ],
                  ),
                  Column(
                    children: [
                      Text('12', style: AppStyles.robotoBold36White),
                      Text(
                        AppLocalizations.of(context)!.watch_list,
                        style: AppStyles.robotoBold24White,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('10', style: AppStyles.robotoBold36White),
                      Text(
                        AppLocalizations.of(context)!.histoyr,
                        style: AppStyles.robotoBold24White,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sizeScreen.width * 0.04,
                  vertical: sizeScreen.height * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: sizeScreen.width * 0.02),
                        child: CustomElevatedButton(
                          onPressed: () {
                            //todo: Edit Profile
                            Navigator.of(context).pushNamed(AppRoutes.updateProfileRouteName);
                          },
                          buttonContent: Text(
                            AppLocalizations.of(context)!.edit_profile,
                            style: AppStyles.robotoRegular20Black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomElevatedButton(
                        onPressed: () {
                          //todo:  Logout
                          Navigator.pushReplacementNamed(context, AppRoutes.loginRouteName);
                        },
                        backgroundColor: AppColors.redColor,
                        borderSideColor: AppColors.transparent,
                        buttonContent: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.exit,
                              style: AppStyles.robotoRegular20White,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(width: sizeScreen.width * 0.03),
                            ImageIcon(AssetImage(AppAssets.exitIcon), color: AppColors.whiteColor),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTab(
                    title: AppLocalizations.of(context)!.watch_list,
                    iconPath: AppAssets.watchListIcon,
                    isSelected: selectedTab == AppLocalizations.of(context)!.watch_list,
                    onTap: () {
                      setState(() {
                        selectedTab = AppLocalizations.of(context)!.watch_list;
                      });
                    },
                    screenWidth: sizeScreen.width,
                  ),
                  buildTab(
                    title: AppLocalizations.of(context)!.histoyr,
                    iconPath: AppAssets.folderIcon,
                    isSelected: selectedTab == AppLocalizations.of(context)!.histoyr,
                    onTap: () {
                      setState(() {
                        selectedTab = AppLocalizations.of(context)!.histoyr;
                      });
                    },
                    screenWidth: sizeScreen.width,
                  ),
                ],
              ),
              AnimatedAlign(
                alignment: selectedTab == AppLocalizations.of(context)!.watch_list
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  height: sizeScreen.height * 0.002,
                  width: sizeScreen.width * 0.5,
                  color: AppColors.yellowColor,
                ),
              ),
              Expanded(
                child: Container(
                  color: AppColors.blackColor,
                  width: double.infinity,
                  child: selectedTab == AppLocalizations.of(context)!.watch_list
                      ? FavoritesPage()
                      : HistoryTabBody(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTab({
    required String title,
    required String iconPath,
    required bool isSelected,
    required VoidCallback onTap,
    required double screenWidth,
  }) {
    return Expanded(
      child: TextButton(
        onPressed: onTap,
        child: Column(
          children: [
            Image.asset(iconPath, color: AppColors.yellowColor),
            Text(title, style: AppStyles.robotoRegular20White.copyWith(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
