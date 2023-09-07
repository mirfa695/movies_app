import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  const CustomText({required this.text, required this.size, Key? key})
      : super(key: key);
  final String text;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: CupertinoColors.white,
          fontSize: size,
          fontWeight: FontWeight.bold,
      fontFamily: 'Inter'),
    );
  }
}
