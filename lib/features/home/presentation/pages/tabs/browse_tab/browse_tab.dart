import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/pages/tabs/browse_tab/widgets/grid_view_item.dart';
import 'package:movies_app/features/home/presentation/pages/tabs/browse_tab/widgets/list_view_item.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/navigation/app_routes.dart';
import '../../../../data/di/di.dart';
import '../../../cubit/browse_tab/browse_tab_states.dart';
import '../../../cubit/browse_tab/browse_tab_view_model.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  late BrowseTabViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = BrowseTabViewModel(repository: injectBrowseTabRepository());
    viewModel.getGenres();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return BlocBuilder<BrowseTabViewModel, BrowseTabState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is BrowseLoadingState) {
          return const Center(
              child: CircularProgressIndicator(color: AppColors.yellowColor));
        } else if (state is BrowseErrorState) {
          return Center(child: Text(state.errorMessage));
        } else if (state is BrowseSuccessState) {
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
                      itemBuilder: (context, index) =>
                          GestureDetector(
                            onTap: () => viewModel.changeSelectedGenre(index),
                            child: ListViewItem(
                              text: state.genres[index],
                              isSelect: state.selectedIndex == index,
                            ),
                          ),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: width * 0.02),
                      itemCount: state.genres.length,
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
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.detailsScreenPageRouteName,
                              arguments: movie?.id,);
                          },
                          child: GridViewItem(
                            imageUrl: movie?.mediumCoverImage ?? '',
                            rateValue: movie?.rating?.toString() ?? '-',
                          ),
                        );
                      },
                      itemCount: state.movies.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

