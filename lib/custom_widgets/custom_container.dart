import 'package:flutter/cupertino.dart';
import 'package:movies_app/utilities/api_constants.dart';
import 'package:movies_app/utilities/dimensions.dart';

class CustomContainer extends StatelessWidget {
   CustomContainer({this.imagelink,
    Key? key}) : super(key: key);
  String? imagelink;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.customHeight(context, 3.354546),width: Dimensions.customWidth(context, 3.2727),
      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(imagelink??ApiConstants.defaultImage),fit: BoxFit.cover),
      borderRadius: const BorderRadius.all(Radius.circular(10))),
    );
  }
}
