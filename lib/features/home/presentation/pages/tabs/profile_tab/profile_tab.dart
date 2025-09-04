import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/core/navigation/app_routes.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';

import '../../../../../../core/constants/app_colors.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String selectedTab = "wishlist";

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery
        .of(context)
        .size;
    return Scaffold(
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
                    CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(AppAssets.jackAvatar),
                    ),
                    SizedBox(height: sizeScreen.height * 0.02),
                    Text('John Safwat', style: AppStyles.robotoBold20White),
                  ],
                ),
                Column(
                  children: [
                    Text('12', style: AppStyles.robotoBold36White),
                    Text('Wish List', style: AppStyles.robotoBold24White),
                  ],
                ),
                Column(
                  children: [
                    Text('10', style: AppStyles.robotoBold36White),
                    Text('History', style: AppStyles.robotoBold24White),
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
                      padding: EdgeInsets.symmetric(
                        horizontal: sizeScreen.width * 0.02,
                      ),
                      child: CustomElevatedButton(
                        onPressed: () {
                          //todo: Edit Profile
                        },
                        buttonContent: Text(
                          'Edit Profile',
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
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.loginRouteName);
                      },
                      backgroundColor: AppColors.redColor,
                      borderSideColor: AppColors.transparent,
                      buttonContent: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Exit',
                            style: AppStyles.robotoRegular20White,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: sizeScreen.width * 0.03),
                          ImageIcon(
                            AssetImage(AppAssets.exitIcon),
                            color: AppColors.whiteColor,
                          ),
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
                  title: "Watch List",
                  iconPath: AppAssets.watchListIcon,
                  isSelected: selectedTab == "wishlist",
                  onTap: () {
                    setState(() {
                      selectedTab = "wishlist";
                    });
                  },
                  screenWidth: sizeScreen.width,
                ),
                buildTab(
                  title: "History",
                  iconPath: AppAssets.folderIcon,
                  isSelected: selectedTab == "history",
                  onTap: () {
                    setState(() {
                      selectedTab = "history";
                    });
                  },
                  screenWidth: sizeScreen.width,
                ),
              ],
            ),
            AnimatedAlign(
              alignment: selectedTab == "wishlist"
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
                child: selectedTab == "wishlist"
                    ? Image.asset(AppAssets.nonSearchTabIcon)
                    : Image.asset(AppAssets.arrowBackIcon),
              ),
            ),
          ],
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
            Text(
              title,
              style: AppStyles.robotoRegular20White.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
