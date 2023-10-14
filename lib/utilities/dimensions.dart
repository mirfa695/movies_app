import 'package:flutter/material.dart';

class Dimensions{
  static double screenHeight (BuildContext context)=>  MediaQuery.of(context).size.height;
  static double customHeight(BuildContext context,double height) =>  screenHeight(context)/height;
  static double screenWidth (BuildContext context)=>  MediaQuery.of(context).size.width;
  static double customWidth(BuildContext context,double width)=>screenWidth(context)/width;
  static double height15(BuildContext context) =>  screenHeight(context)/49.2;
  static double height20(BuildContext context) =>  screenHeight(context)/36.9;
  static double height10(BuildContext context) =>  screenHeight(context)/73.8;
  static double width10(BuildContext context) =>  screenWidth(context)/36;
  static double width20(BuildContext context) =>  screenWidth(context)/18;
  // static Size screenheight (BuildContext context)=>  MediaQuery.of(context).size;
  // static Size fontSize(BuildContext context,Size bold)=>screenheight(context)/bold;
  static double customFontSize(BuildContext context,double size)=>screenWidth(context)/size;
}