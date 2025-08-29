import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_colors.dart';

import 'package:movies_app/core/widgets/custom_text_form_field.dart';
import 'package:movies_app/features/auth/data/reset_password/di/reset_password_di.dart';
import '../../../../../../../core/constants/app_styles.dart';
import '../../../../../../../core/utils/dialog_utils.dart';
import '../../../../../../../core/widgets/custom_elevated_button.dart';

import '../../viewModel/reset_password_view_model_cubit.dart';

class ResetPasswordPageBody extends StatelessWidget {
  ResetPasswordViewModelCubit viewModel = ResetPasswordViewModelCubit(
    resetPasswordRepository: injectResetPasswordRepository(),
  );
  final _formKey = GlobalKey<FormState>();

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  ResetPasswordPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (_) => viewModel,
      child:
          BlocConsumer<
            ResetPasswordViewModelCubit,
            ResetPasswordViewModelState
          >(
            listener: (context, state) {
              if (state is ResetPasswordSuccess) {
                DialogUtils.showMessage(
                  context: context,
                  contentMsg: state.message,
                );
              } else if (state is ResetPasswordError) {
                DialogUtils.showMessage(
                  context: context,
                  contentMsg: state.error,
                );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.02,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(AppAssets.forgetPasswordImage),
                        SizedBox(height: height * 0.02),

                        CustomTextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Old password is required";
                            }
                            return null;
                          },

                          controller: oldPasswordController,
                          hintText: "Old Password",
                          obscureText: viewModel.showPassword,
                          prefixIcon: Image.asset(AppAssets.passwordIcon),
                          hintStyle: AppStyles.robotoRegular16White,
                          sufficIcon: IconButton(
                            icon: Icon(
                              viewModel.showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.whiteColor,
                            ),
                            onPressed: () {
                              viewModel.togglePasswordVisibility();
                            },
                          ),
                        ),
                        SizedBox(height: height * 0.02),

                        CustomTextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "New password is required";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                          controller: newPasswordController,
                          hintText: "New Password",
                          obscureText: viewModel.showPassword,
                          prefixIcon: Image.asset(AppAssets.passwordIcon),
                          hintStyle: AppStyles.robotoRegular16White,
                          sufficIcon: IconButton(
                            icon: Icon(
                              viewModel.showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.whiteColor,
                            ),
                            onPressed: () {
                              viewModel.togglePasswordVisibility();
                            },
                          ),
                        ),
                        SizedBox(height: height * 0.02),

                        CustomTextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please confirm your password";
                            }
                            if (value != newPasswordController.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                          controller: confirmPasswordController,
                          hintText: "Confirm Password",
                          obscureText: viewModel.showPassword,
                          prefixIcon: Image.asset(AppAssets.passwordIcon),
                          hintStyle: AppStyles.robotoRegular16White,
                          sufficIcon: IconButton(
                            icon: Icon(
                              viewModel.showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.whiteColor,
                            ),
                            onPressed: () {
                              viewModel.togglePasswordVisibility();
                            },
                          ),
                        ),
                        SizedBox(height: height * 0.02),

                        CustomElevatedButton(
                          onPressed: state is ResetPasswordLoading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    viewModel.resetPassword(
                                      oldPass: oldPasswordController.text,
                                      newPass: newPasswordController.text,
                                      token: '',
                                    );
                                  }
                                },
                          buttonContent: state is ResetPasswordLoading
                              ? const CircularProgressIndicator(
                                  color: AppColors.yellowColor,
                                )
                              : Text(
                                  "Change Password",
                                  style: AppStyles.robotoRegular16Black,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
    );
  }
}
