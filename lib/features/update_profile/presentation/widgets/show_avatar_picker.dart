import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_colors.dart';

Future<String?> showAvatarPicker(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;

  final avatarList = [
    AppAssets.alexAvatar,
    AppAssets.jackAvatar,
    AppAssets.linaAvatar,
    AppAssets.tomAvatar,
    AppAssets.laylaAvatar,
    AppAssets.monaAvatar,
    AppAssets.chrisAvatar,
    AppAssets.leoAvatar,
    AppAssets.omerAvatar,
  ];

  int selectedIndex = 1;

  return showModalBottomSheet<String>(
    context: context,
    backgroundColor: AppColors.darkGreyColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: avatarList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            selectedIndex == index;
            return InkWell(
              onTap: () {
                // todo: save avatar
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.yellowColor),
                  color: selectedIndex == index
                      ? AppColors.yellowColor
                      : AppColors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.01,
                  vertical: height * 0.01,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(avatarList[index], fit: BoxFit.cover),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
