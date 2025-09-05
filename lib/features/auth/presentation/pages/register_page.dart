import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/core/navigation/app_routes.dart';
import 'package:movies_app/core/utils/dialog_utils.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/features/auth/data/register/di/register_di.dart';
import 'package:movies_app/features/auth/data/register/model/register_model_request.dart';
import 'package:movies_app/features/auth/presentation/cubit/register/register_cubit.dart';
import 'package:movies_app/features/auth/presentation/cubit/register/register_state.dart';
import 'package:movies_app/features/auth/presentation/pages/widgets/language_toggle_switch.dart';
import 'package:movies_app/features/auth/presentation/pages/widgets/two_texts_row.dart';
import '../../../../l10n/app_localizations.dart';
import 'widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPasswordObsecured = true;
  bool isConfirmPasswordObsecured = true;

  RegisterCubit viewModel = RegisterCubit(registerRepository: injectRegisterRepository());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        appBar: buildCustomAppBar(
          title: AppLocalizations.of(context)!.register,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterLoadingState) {
              DialogUtils.showLoading(context: context, loadingText: AppLocalizations.of(context)!.waiting);
            } else if (state is RegisterErrorState) {
              DialogUtils.hideLoading(context: context);
              DialogUtils.showMessage(
                context: context,
                contentMsg: state.errorMessage,
                negActionName: AppLocalizations.of(context)!.ok,
              );
            } else if (state is RegisterSuccessState) {
              DialogUtils.showMessage(
                context: context,
                contentMsg: state.successMessage,
                posActionName: AppLocalizations.of(context)!.ok,
                posActionFunction: () => Navigator.of(context).pushNamed(AppRoutes.loginRouteName),
              );
            }
          },
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(AppAssets.registerScreenImg, height: height * 0.17),
                      SizedBox(height: height * 0.01),
                      Text(
                        'Avatar',
                        style: AppStyles.robotoRegular16White,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextFormField(
                        controller: nameController,
                        hintText: AppLocalizations.of(context)!.name_hint,
                        prefixIcon: Image.asset(AppAssets.nameIcon),
                        hintStyle: AppStyles.robotoRegular16White,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return AppLocalizations.of(context)!.enter_name_error;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextFormField(
                        controller: emailController,
                        hintText: AppLocalizations.of(context)!.email_hint,
                        prefixIcon: Image.asset(AppAssets.emailIcon),
                        hintStyle: AppStyles.robotoRegular16White,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return AppLocalizations.of(context)!.enter_email_error;
                          }
                          final bool emailValid = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          ).hasMatch(text);

                          if (!emailValid) {
                            return AppLocalizations.of(context)!.enter_valid_email_error;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextFormField(
                        controller: passwordController,
                        hintText: AppLocalizations.of(context)!.password_hint,
                        prefixIcon: Image.asset(AppAssets.passwordIcon),
                        sufficIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPasswordObsecured = !isPasswordObsecured;
                            });
                          },
                          child: isPasswordObsecured
                              ? Image.asset(AppAssets.eyeoffIcon)
                              : Icon(Icons.remove_red_eye, color: AppColors.whiteColor),
                        ),

                        hintStyle: AppStyles.robotoRegular16White,
                        obscureText: isPasswordObsecured,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return AppLocalizations.of(context)!.enter_password_error;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextFormField(
                        controller: confirmPasswordController,
                        hintText: AppLocalizations.of(context)!.confirm_password_hint,
                        prefixIcon: Image.asset(AppAssets.passwordIcon),
                        sufficIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isConfirmPasswordObsecured = !isConfirmPasswordObsecured;
                            });
                          },
                          child: isConfirmPasswordObsecured
                              ? Image.asset(AppAssets.eyeoffIcon)
                              : Icon(Icons.remove_red_eye, color: AppColors.whiteColor),
                        ),
                        hintStyle: AppStyles.robotoRegular16White,
                        obscureText: isConfirmPasswordObsecured,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return AppLocalizations.of(context)!.confirm_password_error;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextFormField(
                        controller: phoneNumberController,
                        hintText: AppLocalizations.of(context)!.phone_hint,
                        prefixIcon: Image.asset(AppAssets.phoneNumberIcon),
                        hintStyle: AppStyles.robotoRegular16White,
                        keyboardType: TextInputType.phone,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return AppLocalizations.of(context)!.enter_phone_error;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      CustomElevatedButton(
                        onPressed: () {
                          //register
                          if (formKey.currentState!.validate()) {
                            viewModel.register(
                              UserRequest(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                                phone: phoneNumberController.text,
                                avaterId: 1,
                              ),
                            );
                          }
                        },
                        buttonContent: Text(
                          AppLocalizations.of(context)!.create_account,
                          style: AppStyles.robotoRegular20Black,
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      TwoTextsRow(text1: AppLocalizations.of(context)!.already_have_account,
                          text2: AppLocalizations.of(context)!.login),
                      SizedBox(height: height * 0.02),
                      Center(child: LanguageToggleSwitch()),
                      SizedBox(height: height * 0.2),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
