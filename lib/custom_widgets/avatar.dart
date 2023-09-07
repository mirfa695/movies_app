import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({required this.img, required this.size, Key? key})
      : super(key: key);
  final String img;
  final double size;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(backgroundImage: NetworkImage(img), radius: size);
  }
}
