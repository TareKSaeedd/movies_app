import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/dio_api_manager.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/core/constants/app_styles.dart';
import 'package:movies_app/model/movie_response.dart';

class HomeTab extends StatefulWidget {
   const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex=0;
  final ScrollController _listController = ScrollController();
  late Future<MovieResponse?> moviesFuture;

  @override
  void initState() {
    super.initState();
    moviesFuture = DioApiManager().getMovies();
  }
  /*
  width:430
  height:932
  */
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body:  FutureBuilder<MovieResponse?>(
        future: moviesFuture,
        builder: (context, snapshot) {
          if(snapshot.connectionState ==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: AppColors.yellowColor,),);
          }
          if (snapshot.hasError) {
            return Center(
                child: Text('Something Went Wrong: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No data received'));
          }
          if (snapshot.data?.status != 'ok') {
            return Center(
              child: Text(snapshot.data!.statusMessage ?? 'Unknown error'),);
          }
          var moviesList = snapshot.data?.data?.movies ?? [];

          if (moviesList.isEmpty) {
            return const Center(child: Text("No movies available"));
          }
          return SingleChildScrollView(
            child: Column(
            children: [
          Stack(
                children: [
                  Image.network(
                    moviesList[selectedIndex].largeCoverImage!,
                    width: width,
                    height: height * 0.69,
                    fit: BoxFit.fill,
                    ),
                  Container(
                    height:height*0.69 ,
                    width: width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.transparent,Colors.black],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                        )
                    ),
                  ),
                  Positioned(
                      top:height*0.007,
                      left:width*0.18 ,
                      child:
                      Image.asset(AppAssets.availableNow,
                      )
                  ),
                  Positioned(
                      bottom:height*0.006,
                      left:width*0.08 ,
                      child:
                      Image.asset(AppAssets.watchNow,
                      )
                  ),
                  Positioned(
                      top: height * 0.12,
                      left: 0,
                      right: 0,
                      child: CarouselSlider(
                        options: CarouselOptions(
                            height: height * 0.376,
                            enlargeCenterPage: true,
                            viewportFraction: 0.55,
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          ),
                          items: moviesList.map((movie) {
                            return Builder(
                                builder: (context) {
                                  return Card(
                                    // elevation: 6,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.network(
                                            movie.mediumCoverImage!,
                                            fit: BoxFit.fill,
                                            width: width * 0.54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                            );
                          }).toList(),
                      )),
                  Positioned(
                      top: height*0.14,
                      left: width*0.26,
                      child:
                      generateRatingWidget(
                          width,height,moviesList[selectedIndex].rating.toString(),
                      )
                  )
                    ],
              ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: height*0.02
            ),
            padding: EdgeInsets.symmetric(
              horizontal: width*0.03
            ),
            child: Row(
                    children: [
            Text('Action',style: AppStyles.robotoRegular20White.copyWith(
              decoration: TextDecoration.none
            ),
            ),
            Spacer(),
             Text('See More',style: AppStyles.robotoRegular16Yellow.copyWith(
                    decoration: TextDecoration.none,)),
                InkWell(
                          onTap: () {
                            _listController.animateTo(
                              _listController.offset + (width * 0.36),
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Icon(Icons.arrow_forward,color: AppColors.yellowColor,)),
                    ],
                  ),
          ) ,
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: width*0.03
            ),
            child: SizedBox(
              height: height*0.23,
              child: ListView.separated(
                controller: _listController,
                scrollDirection: Axis.horizontal,
                   itemCount: moviesList.length,
                   separatorBuilder: (context, index) {
                     return SizedBox(width: width*0.03,);
                   },
                   itemBuilder: (context, index) {
                     return Container(
                         padding: EdgeInsets.symmetric(
                             horizontal: width*0.02,
                             vertical: height*0.01
                         ),
                       alignment: Alignment.topLeft,
                       width: width*0.33,
                       height: height*0.51,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15),
                           image:DecorationImage(
                             fit: BoxFit.fill,
                           image: NetworkImage(moviesList[index].mediumCoverImage!,
                           ),
                       ),
                     ),
               child:generateRatingWidget(width,
                   height,moviesList[index].rating.toString())
                     )

                     ;},
            ),
            ),
          )
            ],
          ));
        })
    );
  }
}
Widget generateRatingWidget(double width,double height,String text ){
  return   Container(
    padding: EdgeInsets.symmetric(
        horizontal: width*0.02,
        vertical: height*0.001
    ),
    decoration: BoxDecoration(
      color:  AppColors.darkGreyColor,
        borderRadius: BorderRadius.circular(10)
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text,style: AppStyles.robotoRegular16White,),
        Icon(Icons.star,color: AppColors.yellowColor,)
      ],
    ),
  );
}