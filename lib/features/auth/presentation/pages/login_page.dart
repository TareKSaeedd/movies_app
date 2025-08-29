import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/core/navigation/app_routes.dart';
import 'package:movies_app/core/utils/dialog_utils.dart';
import 'package:movies_app/core/widgets/custom_text_form_field.dart';
import 'package:movies_app/features/auth/data/login/di/login_di.dart';
import 'package:movies_app/features/auth/data/login/model/login_request.dart';
import 'package:movies_app/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:movies_app/features/auth/presentation/cubit/login/login_state.dart';

import '../../../../core/widgets/language_toggle_switch.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordSecured = true;
  LoginCubit loginCubit = LoginCubit(loginRepository: injectLoginRepositoyr());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => loginCubit,
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.05),
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is LoginLoadingState) {
                  DialogUtils.showLoading(context: context, loadingText: 'Waiting');
                } else if (state is LoginErrorState) {
                  DialogUtils.hideLoading(context: context);
                  DialogUtils.showMessage(
                    context: context,
                    contentMsg: state.errorMessage,
                    negActionName: 'OK',
                  );
                } else if (state is LoginSuccessState) {
                  DialogUtils.showMessage(
                    context: context,
                    contentMsg: state.successMessage,
                    posActionName: 'OK',
                    posActionFunction: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
                    },
                  );
                }
              },
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
                    sufficIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordSecured = !isPasswordSecured;
                        });
                      },
                      child: isPasswordSecured
                          ? Image.asset(AppAssets.eyeoffIcon)
                          : Icon(Icons.remove_red_eye, color: AppColors.whiteColor),
                    ),
                    hintText: "Enter your password",
                    hintStyle: AppStyles.robotoRegular16White,
                    obscureText: isPasswordSecured,
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
                      onPressed: () {
                        loginCubit.login(
                          LoginRequest(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      },
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
                      icon: Image.asset(
                        AppAssets.gmailIcon,
                        height: width * 0.1,
                        width: width * 0.1,
                      ),
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
        ),
      ),
    );
  }
}
