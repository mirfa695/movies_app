import 'package:flutter/cupertino.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({required this.imagelink,
    Key? key}) : super(key: key);
 final String imagelink;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,width: 110,
      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(imagelink),fit: BoxFit.cover),
      borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
