import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/bg_image.dart';
import 'package:movies_app/custom_widgets/custom_appbar.dart';
import 'package:movies_app/custom_widgets/custom_container.dart';
import 'package:movies_app/provider/categories_provider.dart';
import 'package:movies_app/utilities/dimensions.dart';
import 'package:provider/provider.dart';
import '../../routes/class_route_names.dart';
import '../../utilities/api_constants.dart';

class TVShows extends StatelessWidget {
  const TVShows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CategoriesProvider>().getTvShows(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomAppbar(),
      body: BgImage(
          wd: Container(
        color: Colors.black.withOpacity(.6),
        child: Consumer<CategoriesProvider>(builder: (BuildContext context, CategoriesProvider value, Widget? child) {
          return value.shows!=null?  GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: value.shows!.length,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: Dimensions.width10(context),
                mainAxisSpacing: Dimensions.height10(context),
                crossAxisCount: 3,
                childAspectRatio: (1 / 2),
              ),
              itemBuilder: (BuildContext context, index) {
                return InkWell(onTap: () {Navigator.pushNamed(context, RouteName.seriesDetailsRoute,arguments: value.shows![index]);},
                  child: CustomContainer(
                    imagelink: value.shows![index].posterPath == null
                        ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyMG5Hj05J34kUvHStqq1zdC3Ym79ItDplK-Gsagk&sh"
                        : ApiConstants.imageUrl +
                        value.shows![index].posterPath!,
                  ),
                );
              }):CircularProgressIndicator();
        },)
      )),
    );
  }
}
