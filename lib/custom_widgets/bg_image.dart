import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  const BgImage({required this.wd,
    Key? key}) : super(key: key);
  final Widget wd;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/img_8.jpg'), fit: BoxFit.cover)),
      child: wd,
    );
  }
}
