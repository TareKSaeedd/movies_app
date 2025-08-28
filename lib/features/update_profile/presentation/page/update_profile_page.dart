import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_avatar.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/core/navigation/app_routes.dart';
import 'package:movies_app/core/utils/dialog_utils.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_text_form_field.dart';
import 'package:movies_app/features/update_profile/data/di/update_profile_di.dart';
import 'package:movies_app/features/update_profile/presentation/cubit/update_profile_state.dart';
import 'package:movies_app/features/update_profile/presentation/cubit/update_profile_view_model.dart';
import 'package:movies_app/features/update_profile/presentation/widgets/show_avatar_picker.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  late UpdateProfileViewModel viewModel;
  int selectedIndex = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = UpdateProfileViewModel(
      repository: injectedUpdateProfileRepository(),
    );
  }

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
            Navigator.pop(context);
          },
          icon: Image.asset(AppAssets.arrowBackIcon),
        ),
      ),
      backgroundColor: AppColors.blackColor,
      body: BlocListener<UpdateProfileViewModel, UpdateProfileState>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is UpdateProfileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.response.message ?? "Profile updated"),
              ),
            );
          } else if (state is UpdateProfileError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<UpdateProfileViewModel, UpdateProfileState>(
          bloc: viewModel,
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02,
                      vertical: height * 0.03,
                    ),
                    child: Form(
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CircleAvatar(
                            radius: width * 0.17,
                            child: GestureDetector(
                              onTap: () async {
                                final selected = await showAvatarPicker(
                                  context,
                                  currentIndex: selectedIndex,
                                );
                                if (selected != null) {
                                  selectedIndex = selected;
                                  viewModel.setAvatar(selected);
                                  setState(() {});
                                }
                              },
                              child: Image.asset(
                                AppAvatars.avatarList[selectedIndex],
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
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Plaese Enter Name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: height * 0.02),
                          CustomTextFormField(
                            controller: phoneController,
                            cursorColor: AppColors.whiteColor,
                            fillColor: AppColors.darkGreyColor,
                            prefixIcon: Image.asset(AppAssets.phoneIcon),
                            hintText: '+201200000000',
                            hintStyle: AppStyles.robotoRegular20White,
                            keyboardType: TextInputType.phone,

                            validator: (text) {
                              final regex = RegExp(r'^\+20[0-9]{9,10}$');
                              if (text == null || text.isEmpty) {
                                return 'Plaese enter phone number';
                              }
                              if (!text.startsWith('+20')) {
                                return 'Phone number must start with +20';
                              }
                              if (!regex.hasMatch(text)) {
                                return 'Enter a valid phone number';
                              }

                              return null;
                            },
                          ),
                          SizedBox(height: height * 0.02),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  AppRoutes.resetPasswordRouteName,
                                );
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
                              DialogUtils.showMessage(
                                context: context,
                                contentMsg:
                                    'Are you sure, you want to delete profile !!',
                                title: 'Warning',
                                posActionName: 'Yes',
                                posActionFunction: () {
                                  viewModel.deleteProfile();
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    AppRoutes.loginRouteName,
                                    (route) => false,
                                  );
                                },
                                negActionName: 'Cancel',
                                negActionFunction: () {
                                  Navigator.pop(context);
                                },
                              );
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
                              if (viewModel.formKey.currentState!.validate()) {
                                viewModel.updateProfile(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  avaterId: selectedIndex,
                                );
                              }
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
                ),

                if (state is UpdateProfileLoading)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.yellowColor,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
