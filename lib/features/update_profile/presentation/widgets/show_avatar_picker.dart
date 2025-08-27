import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_avatar.dart';
import 'package:movies_app/core/constants/app_colors.dart';

Future<int?> showAvatarPicker(BuildContext context, {required int currentIndex}) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  

  int selectedIndex = currentIndex; 

  return showModalBottomSheet<int?>(
    context: context,
    backgroundColor: AppColors.darkGreyColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: AppAvatars.avatarList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    Future.delayed(const Duration(milliseconds: 200), () {
                      Navigator.pop(context, index);
                    });
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
                      child: Image.asset(AppAvatars.avatarList[index], fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
    },
  );
}