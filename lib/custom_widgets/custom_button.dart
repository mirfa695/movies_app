import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/utilities/dimensions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.text,required this.icon,
    Key? key}) : super(key: key);
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              backgroundColor: Colors.black.withOpacity(.3)),
          child: Row(
            children: [
              Icon(icon,color: Colors.white,),
               SizedBox(width: Dimensions.customWidth(context, 18),),
              Text(
                text,
                style:  TextStyle(color: CupertinoColors.white, fontSize: Dimensions.customHeight(context, 41)),
              ),
            ],
          ),
        ));
  }
}
