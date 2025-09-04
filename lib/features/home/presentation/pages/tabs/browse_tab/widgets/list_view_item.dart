import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';

class ListViewItem extends StatelessWidget {
  final String text;
  final bool isSelect;
  const ListViewItem({this.isSelect = false, super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        color: isSelect ? AppColors.yellowColor : AppColors.blackColor,
        border: Border.all(color: AppColors.yellowColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: isSelect
            ? AppStyles.interBold20Black
            : AppStyles.interBold20Yellow,
      ),
    );
  }
}
