import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/utilities/api_constants.dart';
import 'package:movies_app/utilities/dimensions.dart';

import '../model_class/details_class.dart';
import '../routes/class_route_names.dart';
import 'custom_container.dart';

class CustomGridview extends StatelessWidget {
  CustomGridview({required this.similarList, Key? key}) : super(key: key);
  List<Details> similarList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: similarList.length,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: Dimensions.width10(context),
          mainAxisSpacing: Dimensions.height10(context),
          crossAxisCount: 3,
          childAspectRatio: (1 / 2),
        ),
        itemBuilder: (BuildContext context, index) {
          return InkWell(onTap: (){Navigator.pushNamed(context, RouteName.movieDetailsRoute,arguments: similarList[index]);},
            child: CustomContainer(
              imagelink: similarList[index]!.posterPath == null
                  ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyMG5Hj05J34kUvHStqq1zdC3Ym79ItDplK-Gsagk&sh"
                  : ApiConstants.imageUrl + similarList[index]!.posterPath!,
            ),
          );
        });
  }
}
