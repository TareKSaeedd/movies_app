import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/navigation/app_routes.dart';
import 'package:movies_app/features/auth/presentation/pages/forget_password_page.dart';
import 'package:movies_app/features/auth/presentation/pages/login_page.dart';
import 'package:movies_app/features/auth/presentation/pages/register_page.dart';
import 'package:movies_app/features/home/presentation/pages/home_page.dart';
import 'package:movies_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:movies_app/features/update_profile/presentation/page/update_profile_page.dart';
import 'core/utils/bloc_observer.dart';

import 'features/auth/presentation/reset_password_page/view/reset_password_page.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homePageRouteName,
      routes: {
        AppRoutes.onboardingRouteName: (context) => OnboardingPage(),
        AppRoutes.registerRouteName: (context) => RegisterPage(),
        AppRoutes.loginRouteName: (context) => LoginPage(),
        AppRoutes.forgetPasswordRouteName: (context) => ForgetPasswordPage(),
        AppRoutes.updateProfileRouteName: (context) => UpdateProfilePage(),
        AppRoutes.resetPasswordRouteName: (context) => ResetPasswordPage(),
        AppRoutes.homePageRouteName: (context) => HomePage(),
      },
    );
  }
}
