import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/custom_appbar.dart';
import 'package:movies_app/custom_widgets/custom_gridview.dart';
import 'package:movies_app/custom_widgets/custom_scroll_container.dart';
import 'package:movies_app/model_class/details_class.dart';
import 'package:movies_app/provider/home_provider.dart';
import 'package:movies_app/screens/demo_screen.dart';
import 'package:movies_app/screens/dropdown_movies/toprated_movies_screen.dart';
import 'package:movies_app/screens/home/tv_shows_screen.dart';
import 'package:movies_app/screens/dropdown_movies/upcoming_movie_screen.dart';
import 'package:movies_app/utilities/api_constants.dart';
import 'package:movies_app/utilities/dimensions.dart';
import 'package:provider/provider.dart';
import '../../custom_widgets/bg_image.dart';
import '../../custom_widgets/custom_text.dart';
import '../../routes/class_route_names.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Dimensions.screenWidth(context));
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: CustomAppbar(),
        body: BgImage(
            wd: Container(
          color: Colors.black.withOpacity(.6),
          child: FutureBuilder<List<Details>>(
            future: context.read<HomeProvider>().getApi(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(children: [
                        SizedBox(
                          height:   Dimensions.customHeight(context, 1.476),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomScrollContainer(
                                image: ApiConstants.imageUrl +
                                    snapshot.data![index].posterPath!,
                                details: snapshot.data![index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return  SizedBox(
                                width: Dimensions.customWidth(context, 18),
                              );
                            },
                            itemCount: 3,
                          ),
                        ),
                        Positioned(
                            top: Dimensions.customHeight(context, 9.225),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                 SizedBox(
                                  width: Dimensions.height10(context),
                                ),
                                SizedBox(
                                  width: Dimensions.customHeight(context, 7.93548387097),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField(
                                        decoration:  InputDecoration(
                                            border: InputBorder
                                                .none, // Remove the default underline
                                            hintText: 'Movies',
                                            hintStyle: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: Dimensions.customFontSize(context, 24))
                                            // Your hint text
                                            ),
                                        dropdownColor:
                                            const Color.fromRGBO(5, 8, 28, .9),
                                        style:  TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Dimensions.height15(context)),
                                        items: const [
                                          DropdownMenuItem(
                                            value: 'Popular',
                                            child: Text('Popular'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'TopRated',
                                            child: Text('Top Rated'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Upcoming',
                                            child: Text('Upcoming'),
                                          )
                                        ],
                                        onChanged: (v) {
                                          Widget widget;
                                          if (v == 'Popular') {
                                            widget = const HomeScreen();
                                          } else if (v == 'TopRated') {
                                            widget = const TopRatedMovies();
                                          } else if (v == 'Upcoming') {
                                            widget = const UpcomingMovieScreen();
                                          } else {
                                            widget = const Demo();
                                          }
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      widget));
                                        }),
                                  ),
                                ),
                                 SizedBox(
                                  width: Dimensions.customWidth(context, 9),
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TVShows()),
                                      );
                                    },
                                    child:  CustomText(
                                        text: 'TV Shows', size: Dimensions.height15(context))),
                                 SizedBox(
                                  width: Dimensions.customWidth(context, 9),
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RouteName.categoriesRoute);
                                    },
                                    child:  CustomText(
                                        text: 'Categories', size: Dimensions.height15(context))),
                              ],
                            )),
                      ]),
                       Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(text: '  Trending Now', size: Dimensions.height15(context))),
                       SizedBox(height: Dimensions.height15(context)),
                      CustomGridview(similarList: snapshot.data!,)
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(snapshot.error.toString())));
                return Text(snapshot.error.toString());
              }
              return const CircularProgressIndicator();
            },
          ),
        )));
  }
}
