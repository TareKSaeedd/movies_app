import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_app/core/navigation/app_routes.dart';
import 'package:movies_app/core/services/cubit/language_cubit.dart';
import 'package:movies_app/core/services/cubit/language_state.dart';
import 'package:movies_app/features/auth/presentation/pages/forget_password_page.dart';
import 'package:movies_app/features/auth/presentation/pages/login_page.dart';
import 'package:movies_app/features/auth/presentation/pages/register_page.dart';
import 'package:movies_app/features/home/presentation/pages/home_page.dart';
import 'package:movies_app/features/movie_details_screen/presentation/page/movie_details_screen.dart';
import 'package:movies_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:movies_app/features/update_profile/presentation/page/update_profile_page.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'core/services/prefrences_service.dart';
import 'features/auth/presentation/pages/reset_password_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefsService = PreferencesService();
  final savedLocale = await prefsService.getSelectedLanguage();
  runApp(
    BlocProvider(
      create: (context) => LanguageCubit(prefsService, savedLocale),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        final locale = state is LanguageChanged
            ? state.locale
            : state is LanguageInitial
            ? state.locale
            : const Locale('en');
        return MaterialApp(
          supportedLocales: const [Locale('en'), Locale('ar')],
          locale: locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.onboardingRouteName,
          routes: {
            AppRoutes.onboardingRouteName: (context) => OnboardingPage(), //todo: done localization
            AppRoutes.registerRouteName: (context) => RegisterPage(), // todo : done localization
            AppRoutes.loginRouteName: (context) => LoginPage(), // todo : done localization
            AppRoutes.forgetPasswordRouteName: (context) => ForgetPasswordPage(),
            AppRoutes.updateProfileRouteName: (context) =>
                UpdateProfilePage(), // todo : done localization
            AppRoutes.resetPasswordRouteName: (context) => ResetPasswordPage(),
            AppRoutes.homePageRouteName: (context) => HomePage(),
            AppRoutes.detailsScreenPageRouteName: (context) => MovieDetailsScreen(),
          },
        );
      },
    );
  }
}
