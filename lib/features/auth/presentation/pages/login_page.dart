import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/core/navigation/app_routes.dart';
import 'package:movies_app/core/widgets/custom_text_form_field.dart';

import '../../../../core/widgets/language_toggle_switch.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.05),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppAssets.loginScreenLogo, height: height * 0.2),
              SizedBox(height: height * 0.05),

              CustomTextFormField(
                controller: emailController,
                prefixIcon: Image.asset(AppAssets.emailIcon),
                hintText: "Enter your email",
                hintStyle: AppStyles.robotoRegular16White,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: height * 0.03),

              CustomTextFormField(
                controller: passwordController,
                prefixIcon: Image.asset(AppAssets.passwordIcon),
                sufficIcon: Image.asset(AppAssets.eyeoffIcon),
                hintText: "Enter your password",
                hintStyle: AppStyles.robotoRegular16White,
                obscureText: true,
                obscuringCharacter: '•',
              ),

              SizedBox(height: height * 0.01),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.forgetPasswordRouteName);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.yellowColor,
                    textStyle: AppStyles.robotoRegular14Yellow,
                  ),
                  child: const Text("Forget Password?"),
                ),
              ),

              SizedBox(height: height * 0.02),

              SizedBox(
                width: double.infinity,
                height: height * 0.07,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellowColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Text("Login", style: AppStyles.robotoRegular20Black),
                ),
              ),

              SizedBox(height: height * 0.03),

              RichText(
                text: TextSpan(
                  text: "Don’t Have Account  ?  ",
                  style: AppStyles.robotoRegular14White,
                  children: [
                    TextSpan(
                      text: "Create One",
                      style: AppStyles.robotoBlack14Yellow,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, AppRoutes.registerRouteName);
                        },
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.03),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.2,
                    child: Divider(color: AppColors.yellowColor, thickness: 2),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: Text("OR", style: AppStyles.robotoRegular15Yellow),
                  ),

                  SizedBox(
                    width: width * 0.2,
                    child: Divider(color: AppColors.yellowColor, thickness: 2),
                  ),
                ],
              ),

              SizedBox(height: height * 0.03),

              SizedBox(
                width: double.infinity,
                height: height * 0.07,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(AppAssets.gmailIcon, height: width * 0.1, width: width * 0.1),
                  label: Text("Login With Google", style: AppStyles.robotoRegular16Black),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellowColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Center(child: LanguageToggleSwitch()),
            ],
          ),
        ),
      ),
    );
  }
}
