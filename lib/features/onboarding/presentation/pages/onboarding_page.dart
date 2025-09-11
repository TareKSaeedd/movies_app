import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/features/onboarding/data/model/onboarding_model/onboarding_model.dart';
import 'package:movies_app/l10n/app_localizations.dart';

import '../../../auth/presentation/pages/login_page.dart';

/*
w = 430
h = 932
*/
class OnboardingPage extends StatefulWidget {
   const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}
class _OnboardingPageState extends State<OnboardingPage> {
  late List<OnboardingModel> onBoardingPages;
  final PageController _pageController = PageController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    onBoardingPages = OnboardingModel.pages(context);
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // final List<OnboardingModel> onBoardingPages = OnboardingModel.pages(context);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemCount: onBoardingPages.length,
        itemBuilder: (context, index) {
          final page = onBoardingPages[index];
          if (index == 0) {
            return Stack(
              children: [
                Positioned.fill(child: Image.asset(page.imagePath, fit: BoxFit.cover)),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: page.gradientColors,
                        stops: [0.02, 1],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        page.title,
                        style: AppStyles.interMedium36White,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenSize.height * 0.01),
                      Text(
                        page.description ?? '',
                        style: AppStyles.interRegular20White,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      CustomElevatedButton(
                        onPressed: () => nextPage(),
                        buttonContent: Text(AppLocalizations.of(context)!.explore_now, style: AppStyles.interBold20Black),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.only(bottom: screenSize.height * 0.3),
                  child: Image.asset(page.imagePath, fit: BoxFit.cover),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: page.gradientColors,
                      stops: [0.05, .8],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: screenSize.height * 0.03,
                    horizontal: screenSize.width * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        page.title,
                        textAlign: TextAlign.center,
                        style: AppStyles.interBold24White,
                      ),
                      SizedBox(height: screenSize.height * 0.01),
                      Text(
                        page.description ?? '',
                        textAlign: TextAlign.center,
                        style: AppStyles.interRegular20White,
                      ),
                      SizedBox(height: screenSize.height * 0.01),
                      CustomElevatedButton(
                        onPressed: () {
                          if (index == onBoardingPages.length - 1) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          } else {
                            nextPage();
                          }
                        },
                        buttonContent: Text(
                          index == onBoardingPages.length - 1 ? AppLocalizations.of(context)!.finish
                              : AppLocalizations.of(context)!.next,
                          style: AppStyles.interSemiBoldBlack.copyWith(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.01),

                      if (index >= 2)
                        CustomElevatedButton(
                          onPressed: () => previousPage(),
                          backgroundColor: AppColors.blackColor,
                          borderSideColor: AppColors.yellowColor,
                          buttonContent: Text(
                            AppLocalizations.of(context)!.back,
                            style: AppStyles.interSemiBoldYellow.copyWith(fontSize: 20),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void nextPage() {
    if (currentPage < onBoardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }
}
