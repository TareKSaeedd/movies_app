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
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Stack(
        children: [
          tabs[selectedIndex],
          Positioned(
            left: sizeScreen.width * 0.02,
            right: sizeScreen.width * 0.02,
            bottom: sizeScreen.height * 0.02,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.darkGreyColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: AppColors.whiteColor,
                selectedItemColor: AppColors.yellowColor,
                currentIndex: selectedIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
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
            ),
          ),
        ],
      ),
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
