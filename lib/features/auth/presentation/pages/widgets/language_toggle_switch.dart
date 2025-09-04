import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/services/cubit/language_cubit.dart';
import '../../../../../core/services/cubit/language_state.dart';

class LanguageToggleSwitch extends StatefulWidget {

  const LanguageToggleSwitch({super.key});
  @override
  State<LanguageToggleSwitch> createState() => _LanguageToggleSwitchState();
}

class _LanguageToggleSwitchState extends State<LanguageToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<LanguageCubit>().state;
    int currentIndex;
    if (state is LanguageInitial) {
      currentIndex = state.locale.languageCode == 'ar' ? 1 : 0;
    } else if (state is LanguageChanged) {
      currentIndex = state.locale.languageCode == 'ar' ? 1 : 0;
    } else {
      currentIndex = 0;
    }
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return  ToggleSwitch(
      dividerMargin: 0,
      minWidth: width * 0.14,
      minHeight: height * 0.04,
      borderColor: [AppColors.yellowColor] ,
      borderWidth: 1,
      cornerRadius: 30,
      changeOnTap: true,
      initialLabelIndex: currentIndex,
      activeBgColor: [Colors.transparent],
      activeBorders:
      [
        Border.all(
            color:  AppColors.yellowColor , width: 3.0),
      ],

      customWidgets: [
        Image.asset(AppAssets.englishFlag,fit: BoxFit.cover)
        ,
        Image.asset(AppAssets.egyptFlag,fit: BoxFit.fill)
      ],
      inactiveBgColor: Colors.transparent,
      totalSwitches: 2,
      radiusStyle: true,
      onToggle:(index) {
        final newLocale = (index == 0) ? const Locale('en') : const Locale('ar');
        context.read<LanguageCubit>().changeLanguage(newLocale);  },
    );
  }
}