import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/features/auth/presentation/pages/widgets/two_texts_row.dart';
import 'widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'widgets/language_toggle_switch.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: buildCustomAppBar(
        title: 'Register',
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.registerScreenImg, height: height * 0.17),
              SizedBox(height: height * 0.01),
              Text('Avatar', style: AppStyles.robotoRegular16White, textAlign: TextAlign.center),
              SizedBox(height: height * 0.02),
              CustomTextFormField(
                controller: nameController,
                hintText: 'Name',
                prefixIcon: Image.asset(AppAssets.nameIcon),
              ),
              SizedBox(height: height * 0.02),
              CustomTextFormField(
                controller: emailController,
                hintText: 'Email',
                prefixIcon: Image.asset(AppAssets.emailIcon),
              ),
              SizedBox(height: height * 0.02),
              CustomTextFormField(
                controller: passwordController,
                hintText: 'Password',
                prefixIcon: Image.asset(AppAssets.passwordIcon),
                sufficIcon: Image.asset(AppAssets.eyeoffIcon),
              ),
              SizedBox(height: height * 0.02),
              CustomTextFormField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                prefixIcon: Image.asset(AppAssets.passwordIcon),
                sufficIcon: Image.asset(AppAssets.eyeoffIcon),
              ),
              SizedBox(height: height * 0.02),
              CustomTextFormField(
                controller: phoneNumberController,
                hintText: 'Phone Number',
                prefixIcon: Image.asset(AppAssets.phoneNumberIcon),
              ),
              SizedBox(height: height * 0.02),
              CustomElevatedButton(
                onPressed: () {
                  //register
                },
                buttonContent: Text('Create Account', style: AppStyles.robotoRegular20Black),
              ),
              SizedBox(height: height * 0.02),
              TwoTextsRow(text1: 'Already Have Account ? ', text2: 'Login'),
              SizedBox(height: height * 0.02),
              Center(child: LanguageToggleSwitch()),
              SizedBox(height: height * 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
