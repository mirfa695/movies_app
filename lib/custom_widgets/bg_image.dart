import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  const BgImage({required this.wd,
    Key? key}) : super(key: key);
  final Widget wd;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/img_7.png'), fit: BoxFit.cover)),
      child: wd,
    );
  }
}
