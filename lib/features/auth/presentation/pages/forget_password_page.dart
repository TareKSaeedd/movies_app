import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import 'widgets/forget_password_page_body.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: Text(AppLocalizations.of(context)!.forget_password,style: AppStyles.robotoRegular16Yellow,),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: AppColors.yellowColor,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ForgetPasswordPageBody(),
    );
  }
}
