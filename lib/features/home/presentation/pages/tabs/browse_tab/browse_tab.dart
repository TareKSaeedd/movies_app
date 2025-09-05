import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_assets.dart';
import 'widgets/grid_view_item.dart';
import 'widgets/list_view_item.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  int selectedIndex = 0;

  final List<String> genres = [
    "Action",
    "Adventure",
    "Animation",
    "Biography",
    "Comedy",
    "Crime",
    "Documentary",
    "Drama",
    "Family",
    "Fantasy",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.06,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: ListViewItem(
                    text: genres[index],
                    isSelect: selectedIndex == index,
                  ),
                ),
                separatorBuilder: (context, index) =>
                    SizedBox(width: width * 0.02),
                itemCount: genres.length,
              ),
            ),
            SizedBox(height: height * 0.02),

            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: width * 0.05,
                  mainAxisSpacing: height * 0.02,
                ),
                itemBuilder: (context, index) => GridViewItem(
                  imageUrl: AppAssets.onboarding3,
                  rateValue: "8.${index}",
                ),
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
