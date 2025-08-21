import 'package:flutter/material.dart';
import 'package:movies_app/core/navigation/app_routes.dart';
import 'package:movies_app/features/auth/presentation/pages/forget_password_page.dart';
import 'package:movies_app/features/auth/presentation/pages/login_page.dart';
import 'package:movies_app/features/auth/presentation/pages/register_page.dart';
import 'package:movies_app/features/onboarding/presentation/pages/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginRouteName,

      routes: {
        AppRoutes.onboardingRouteName: (context) => OnboardingPage(),
        AppRoutes.registerRouteName: (context) => RegisterPage(),
        AppRoutes.loginRouteName: (context) => LoginPage(),
        AppRoutes.forgetPasswordRouteName: (context) => ForgetPasswordPage(),
        AppRoutes.updateProfileRouteName: (context) => UpdateProfilePage(),
      },
    );
  }
}
