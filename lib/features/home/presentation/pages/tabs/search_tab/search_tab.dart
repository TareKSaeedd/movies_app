import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';

import '../../../../../../l10n/app_localizations.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: Padding(
          padding: EdgeInsets.symmetric(
              vertical: sizeScreen.height * 0.06,
              horizontal: sizeScreen.width * 0.001
          ),
          child: Column(
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                  textSelectionTheme: const TextSelectionThemeData(
                    selectionColor: AppColors.yellowColor,
                    selectionHandleColor: AppColors.whiteColor,
                  ),
                ),
                child: TextField(
                  cursorColor: AppColors.whiteColor,
                  style: AppStyles.robotoRegular16White,

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.darkGreyColor,
                    prefixIcon: ImageIcon(
                        AssetImage(AppAssets.searchTabIconUnSelected)),
                    prefixIconColor: AppColors.whiteColor,
                    hintText: AppLocalizations.of(context)!.search,
                    hintStyle: AppStyles.robotoRegular16White,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),


                  ),
                ),
              )
            ],
          ),
        ),
      ),

      body: // todo: search ?  data :  icon
      Center(
        child: Image.asset(AppAssets.nonSearchTabIcon),
      ),

    );
  }
}
