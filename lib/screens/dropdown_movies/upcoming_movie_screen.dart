import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/custom_appbar.dart';
import 'package:movies_app/custom_widgets/custom_scroll_container.dart';
import 'package:movies_app/provider/categories_provider.dart';
import 'package:movies_app/screens/demo_screen.dart';
import 'package:movies_app/screens/dropdown_movies/toprated_movies_screen.dart';
import 'package:movies_app/screens/home/tv_shows_screen.dart';
import 'package:movies_app/utilities/api_constants.dart';
import 'package:movies_app/utilities/dimensions.dart';
import 'package:provider/provider.dart';
import '../../custom_widgets/bg_image.dart';
import '../../custom_widgets/custom_gridview.dart';
import '../../custom_widgets/custom_text.dart';
import '../../routes/class_route_names.dart';
import '../home/home_screen.dart';

class UpcomingMovieScreen extends StatelessWidget {
  const UpcomingMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CategoriesProvider>().getUpComing(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar:CustomAppbar(),
        body: BgImage(
            wd: Container(
          color: Colors.black.withOpacity(.6),
          child: Consumer<CategoriesProvider>(builder: (BuildContext context, value, Widget? child) {

            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(children: [
                    SizedBox(
                      height: Dimensions.customHeight(context, 1.476),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomScrollContainer(
                            image: value.details![index].posterPath!=null?
                            ApiConstants.imageUrl +
                                value.details![index].posterPath!:ApiConstants.defaultImage,
                          );
                        },
                        separatorBuilder:
                            (BuildContext context, int index) {
                          return  SizedBox(
                            width: Dimensions.customWidth(context, 36),
                          );
                        },
                        itemCount: 3,
                      ),
                    ),
                    Positioned(
                        top: Dimensions.customHeight(context, 8.68),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                             SizedBox(
                              width: Dimensions.customWidth(context, 36),
                            ),
                            SizedBox(
                              width: Dimensions.customWidth(context, 3.87),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField(
                                    decoration:  InputDecoration(
                                        border: InputBorder
                                            .none, // Remove the default underline
                                        hintText: 'Movies',
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Dimensions.height15(context))
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
                              width: Dimensions.customWidth(context, 36),
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
                      child: CustomText(text: '  Trending Now', size: Dimensions.customHeight(context, 36.9))),
                   SizedBox(height: Dimensions.height15(context)),

                  CustomGridview(similarList: value.details??[],)
                ],
              ),
            );
          },)
        )));
  }
}
