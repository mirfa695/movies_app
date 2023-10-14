import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/bg_image.dart';
import 'package:movies_app/custom_widgets/custom_appbar.dart';
import 'package:movies_app/custom_widgets/custom_container.dart';
import 'package:movies_app/custom_widgets/custom_text.dart';
import 'package:movies_app/provider/categories_provider.dart';
import 'package:movies_app/utilities/api_constants.dart';
import 'package:movies_app/utilities/dimensions.dart';
import 'package:provider/provider.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var provider=context.read<CategoriesProvider>();
    provider.getTvShows(context);
    provider.getTopRated(context);
    provider.getUpComing(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(),
      body: BgImage(
        wd: Container(
          color: Colors.black.withOpacity(.6),
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(top: Dimensions.customHeight(context, 8.2)),
              child: Column(
                children: [
                   Align(
                      alignment: Alignment.topLeft,
                      child: CustomText(
                        text: 'TV Shows',
                        size: Dimensions.height20(context),
                      )),
                   SizedBox(
                    height: Dimensions.height20(context),
                  ),
                  Consumer<CategoriesProvider>(builder: (BuildContext context, CategoriesProvider value, Widget? child) {

                    return SizedBox(
                      height: Dimensions.customHeight(context, 4.1),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            final imageUrl = value
                                .shows?[index].posterPath!=
                                null
                                ? ApiConstants.imageUrl +
                                value.shows![index].posterPath!
                                : 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png';
                            return CustomContainer(imagelink: imageUrl);
                          },
                          separatorBuilder:
                              (BuildContext context, int index) {
                            return const SizedBox(
                              width: 5,
                            );
                          },
                          itemCount: value.shows?.length??10),
                    );
                  },),
                   SizedBox(
                    height: Dimensions.height20(context),
                  ),
                   Align(
                      alignment: Alignment.topLeft,
                      child: CustomText(
                        text: 'Top-Rated Movies',
                        size: Dimensions.height20(context),
                      )),
                   SizedBox(
                    height: Dimensions.height20(context),
                  ),
                 Consumer<CategoriesProvider>(builder: (BuildContext context, CategoriesProvider value, Widget? child) {

                   return SizedBox(
                     height: Dimensions.customHeight(context, 4.1),
                     child: ListView.separated(
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (BuildContext context, int index) {
                           final imageUrl = value
                               .movies?[index].posterPath !=
                               null
                               ? ApiConstants.imageUrl +
                               value.movies![index].posterPath!
                               : 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png';
                           return CustomContainer(imagelink: imageUrl);
                         },
                         separatorBuilder:
                             (BuildContext context, int index) {
                           return  SizedBox(
                             width: Dimensions.customWidth(context, 72),
                           );
                         },
                         itemCount: value.movies?.length??10),
                   );
                 },),
                   SizedBox(
                    height: Dimensions.height20(context),
                  ),
                   Align(
                      alignment: Alignment.topLeft,
                      child: CustomText(
                        text: 'Upcoming Movies',
                        size: Dimensions.height20(context),
                      )),
                   SizedBox(
                    height: Dimensions.height20(context),
                  ),
                  Consumer<CategoriesProvider>(builder: (BuildContext context, CategoriesProvider value, Widget? child) {

                    return SizedBox(
                      height: Dimensions.customHeight(context, 4.1),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            final imageUrl = value
                                .details?[index].posterPath !=
                                null
                                ? ApiConstants.imageUrl +
                                value.details![index].posterPath!
                                : ApiConstants.defaultImage;
                            return CustomContainer(imagelink: imageUrl);
                          },
                          separatorBuilder:
                              (BuildContext context, int index) {
                            return  SizedBox(
                              width: Dimensions.customWidth(context, 72),
                            );
                          },
                          itemCount: value.details?.length??10),
                    );
                  },)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
