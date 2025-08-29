import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/core/navigation/app_routes.dart';

import '../../../../../../core/constants/app_colors.dart';

import 'widgets/reset_password_page_body.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: Text("Reset Password",style: AppStyles.robotoRegular16Yellow,),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: AppColors.yellowColor,),
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.updateProfileRouteName);
          },
        ),
      ),
      body: ResetPasswordPageBody(),
    );
  }
}
