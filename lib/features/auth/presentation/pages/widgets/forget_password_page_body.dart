import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_assets.dart';

import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_text_form_field.dart';

import '../../../../../core/constants/app_styles.dart';

class ForgetPasswordPageBody extends StatelessWidget {
  ForgetPasswordPageBody({super.key});
 final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.02),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Image.asset(AppAssets.forgetPasswordImage),

            SizedBox(height: height * 0.01),

            CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Image.asset(AppAssets.emailIcon),
              controller: emailController,
              hintText: "Email",
              hintStyle: AppStyles.robotoRegular16White,
            ),
            SizedBox(height: height * 0.02),

            CustomElevatedButton(
              onPressed: verifyEmail,
              buttonContent: Text("Verify Email", style: AppStyles.robotoRegular16Black),
            ),
          ],
        ),
      ),
    );
  }

  void verifyEmail() {
    // todo: verify email logic
    debugPrint("verify email");
  }
}
