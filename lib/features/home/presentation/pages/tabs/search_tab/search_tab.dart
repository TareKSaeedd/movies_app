import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/features/home/data/di/di.dart';
import 'package:movies_app/features/home/presentation/cubit/search/search_tab_state.dart';
import 'package:movies_app/features/home/presentation/cubit/search/search_tab_view_model.dart';
import 'package:movies_app/features/home/presentation/pages/tabs/search_tab/movie_card.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
 late SearchTabViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = SearchTabViewModel(searchRepository: injectSearchTabRepository());
  }
  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: Padding(
          padding: EdgeInsets.symmetric(
              vertical: sizeScreen.height * 0.06,
              horizontal: sizeScreen.width * 0.001
          ),
          child: Column(
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                  textSelectionTheme: const TextSelectionThemeData(
                    selectionColor: AppColors.yellowColor,
                    selectionHandleColor: AppColors.whiteColor,
                  ),
                ),
                child: TextField(
                  cursorColor: AppColors.whiteColor,
                  style: AppStyles.robotoRegular16White,

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.darkGreyColor,
                    prefixIcon: ImageIcon(
                        AssetImage(AppAssets.searchTabIconUnSelected)),
                    prefixIconColor: AppColors.whiteColor,
                    hintText: 'Search',
                    hintStyle: AppStyles.robotoRegular16White,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),


                  ),
                  onChanged: (query) {
                    if (query.isNotEmpty) {
                      viewModel.searchMovies(query);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),

      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: sizeScreen.width * 0.02,
          vertical: sizeScreen.height * 0.015
        ),
        child: BlocBuilder<SearchTabViewModel,SearchState>(
          bloc: viewModel,
          builder: (context, state) {
            if (state is SearchInitial) {
              return Center(child: Image.asset(AppAssets.nonSearchTabIcon));
            } else if(state is SearchSuccess){
              return state.movies.isEmpty ?
              Center(child: Image.asset(AppAssets.nonSearchTabIcon)):
              GridView.builder(
            itemCount: state.movies.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.65,
              ),
             itemBuilder: (context, index) {
              
              return MovieCard(movie: state.movies[index]);
             },);
            }else if(state is SearchError){
              return Center(
                child: Text(state.message),
              );
            }else{
              return Container(
                      color: Colors.black.withOpacity(0.5),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.yellowColor,
                        ),
                      ),
                    );
            }
          },
        ),
      )
      );      
    
  }
}
