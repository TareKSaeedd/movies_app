import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_text_form_field.dart';
import 'package:movies_app/features/update_profile/presentation/widgets/show_avatar_picker.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: Text('Pick Avatar', style: AppStyles.robotoRegular16Yellow),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            //todo: navigator pop
          },
          icon: Image.asset(AppAssets.arrowBackIcon),
        ),
      ),
      backgroundColor: AppColors.blackColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: width * 0.02,
            vertical: height * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: width * 0.17,
                child: InkWell(
                  onTap: () {
                    showAvatarPicker(context);
                  },
                  child: Image.asset(
                    AppAssets.jackAvatar,
                    fit: BoxFit.contain,
                    width: width,
                    height: height,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              CustomTextFormField(
                controller: nameController,
                cursorColor: AppColors.whiteColor,
                fillColor: AppColors.darkGreyColor,
                prefixIcon: Image.asset(AppAssets.personIcon),
                hintText: 'John Safwat',
                hintStyle: AppStyles.robotoRegular20White,
              ),
              SizedBox(height: height * 0.02),
              CustomTextFormField(
                controller: phoneController,
                cursorColor: AppColors.whiteColor,
                fillColor: AppColors.darkGreyColor,
                prefixIcon: Image.asset(AppAssets.phoneIcon),
                hintText: '01200000000',
                hintStyle: AppStyles.robotoRegular20White,
              ),
              SizedBox(height: height * 0.02),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    //todo: navigator to reset password screen
                  },
                  child: Text(
                    'Reset Password',
                    style: AppStyles.robotoRegular20White,
                  ),
                ),
              ),
              SizedBox(height: height * 0.25),
              CustomElevatedButton(
                backgroundColor: AppColors.redColor,

                onPressed: () {
                  //todo: Delete Account
                },
                borderSideColor: AppColors.redColor,
                buttonContent: Text(
                  'Delete Account',
                  style: AppStyles.robotoRegular20White,
                ),
              ),
              SizedBox(height: height * 0.02),
              CustomElevatedButton(
                onPressed: () {
                  //todo: Update Data
                },
                buttonContent: Text(
                  'Update Data',
                  style: AppStyles.robotoRegular20Black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
