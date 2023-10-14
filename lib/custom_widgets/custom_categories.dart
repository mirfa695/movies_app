import 'package:flutter/cupertino.dart';
import 'package:movies_app/utilities/dimensions.dart';

class CustomCategories extends StatelessWidget {
  const CustomCategories(
      {required this.imagelink, required this.text, Key? key})
      : super(key: key);
  final String imagelink;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.customHeight(context, 3.35),
      width: Dimensions.customWidth(context, 3.2728),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imagelink), fit: BoxFit.cover),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Container(
        color: CupertinoColors.black.withOpacity(.5),
        child: Center(
          child: Text(
            text,
            style:  TextStyle(color: CupertinoColors.white,fontSize: Dimensions.customHeight(context, 36.9)),

          ),
        ),
      ),
    );
  }
}
