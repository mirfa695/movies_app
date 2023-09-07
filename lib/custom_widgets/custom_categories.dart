import 'package:flutter/cupertino.dart';

class CustomCategories extends StatelessWidget {
  const CustomCategories(
      {required this.imagelink, required this.text, Key? key})
      : super(key: key);
  final String imagelink;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: CupertinoColors.black.withOpacity(.5),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: CupertinoColors.white,fontSize: 20),

          ),
        ),
      ),
      height: 220,
      width: 110,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imagelink), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
