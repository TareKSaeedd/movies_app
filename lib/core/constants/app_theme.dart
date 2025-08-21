import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      elevation: 0,
      titleTextStyle: AppStyles.robotoRegular16Yellow,
      iconTheme: IconThemeData(color: AppColors.yellowColor),
      centerTitle: true,
    ),

    textTheme: TextTheme(headlineSmall: AppStyles.robotoRegular16Yellow),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      elevation: 0,
      titleTextStyle: AppStyles.robotoBold24White,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.yellowColor),
    ),

    textTheme: TextTheme(headlineSmall: AppStyles.robotoRegular16Yellow),
  );
}
