import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/features/home/presentation/pages/tabs/browse_tab/browse_tab.dart';
import 'package:movies_app/features/home/presentation/pages/tabs/home_tab/home_tab.dart';
import 'package:movies_app/features/home/presentation/pages/tabs/profile_tab/profile_tab.dart';
import 'package:movies_app/features/home/presentation/pages/tabs/search_tab/search_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomeTab(), SearchTab(), BrowseTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.blackColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColors.whiteColor,
        selectedItemColor: AppColors.yellowColor,
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          builtBottomNavigationBarItem(
            iconName: AppAssets.homeTabIconUnSelected,
          ),
          builtBottomNavigationBarItem(
            iconName: AppAssets.searchTabIconUnSelected,
          ),
          builtBottomNavigationBarItem(
            iconName: AppAssets.browseTabIconUnSelected,
          ),
          builtBottomNavigationBarItem(
            iconName: AppAssets.profileTabIconUnSelected,
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }

  BottomNavigationBarItem builtBottomNavigationBarItem({
    required String iconName,
  }) {
    return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(iconName)),
      label: '',
    );
  }
}
