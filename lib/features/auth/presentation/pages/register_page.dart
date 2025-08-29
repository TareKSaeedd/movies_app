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
import 'package:movies_app/features/auth/presentation/pages/widgets/two_texts_row.dart';
import 'widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'widgets/language_toggle_switch.dart';

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
          title: 'Register',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        body: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterLoadingState) {
              DialogUtils.showLoading(context: context, loadingText: 'Waiting');
            } else if (state is RegisterErrorState) {
              DialogUtils.hideLoading(context: context);
              DialogUtils.showMessage(
                context: context,
                contentMsg: state.errorMessage,
                negActionName: 'OK',
              );
            } else if (state is RegisterSuccessState) {
              DialogUtils.showMessage(
                context: context,
                contentMsg: state.successMessage,
                posActionName: 'OK',
                posActionFunction: () => Navigator.of(context).pushNamed(AppRoutes.loginRouteName),
              );
            }
          },
          child: Container(
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
                      hintText: 'Name',
                      prefixIcon: Image.asset(AppAssets.nameIcon),
                      hintStyle: AppStyles.robotoRegular16White,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'Email',
                      prefixIcon: Image.asset(AppAssets.emailIcon),
                      hintStyle: AppStyles.robotoRegular16White,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please enter your Email';
                        }
                        final bool emailValid = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                        ).hasMatch(text);

                        if (!emailValid) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'Password',
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
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextFormField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
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
                          return 'Please enter your confirm password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextFormField(
                      controller: phoneNumberController,
                      hintText: 'Phone Number',
                      prefixIcon: Image.asset(AppAssets.phoneNumberIcon),
                      hintStyle: AppStyles.robotoRegular16White,
                      keyboardType: TextInputType.phone,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    CustomElevatedButton(
                      onPressed: () {
                        //register
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
          ),
        ),
      ),
    );
  }
}
