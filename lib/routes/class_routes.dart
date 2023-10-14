import 'package:flutter/material.dart';
import 'package:movies_app/model_class/details_class.dart';
import 'package:movies_app/model_class/tv_show_class.dart';
import 'package:movies_app/screens/demo_screen.dart';
import 'package:movies_app/screens/entry/login_screen.dart';
import 'package:movies_app/screens/entry/otp_screen.dart';
import 'package:movies_app/screens/entry/signup_screen.dart';
import 'package:movies_app/screens/home/profile_screen.dart';
import 'package:movies_app/screens/home/series_details_screen.dart';
import '../screens/home/navigation.dart';
import '../screens/home/categories_screen.dart';
import '../screens/home/movie_details_screen.dart';
import 'class_route_names.dart';

class RouteClass{

  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(
    settings.name
    ){
      case RouteName.loginRoute:return MaterialPageRoute(builder: (context)=>LoginScreen());
      case RouteName.registerRoute:return MaterialPageRoute(builder: (context)=>SignUpScreen());
      case RouteName.homeRoute:return MaterialPageRoute(builder: (context)=>const Navigation());
      case RouteName.categoriesRoute:return MaterialPageRoute(builder: (context)=>const CategoriesScreen());
      case RouteName.demoRoute:return MaterialPageRoute(builder: (context)=>const Demo());
      case RouteName.movieDetailsRoute:return MaterialPageRoute(builder: (context)=> MovieDetails(details: args as Details,));
      case RouteName.seriesDetailsRoute:return MaterialPageRoute(builder: (context)=> SeriesDetails(details: args as TvShowss,));
      case RouteName.profileRoute:return MaterialPageRoute(builder: (context)=>const Profile());
      case RouteName.otpRoute:return MaterialPageRoute(builder: (context){
        ScreenArguments argument = args as ScreenArguments;
        return OtpScreen(email: argument.email,password:argument.password);});
      default:return MaterialPageRoute(builder: (context)=>const Demo() );
    }
  }
}
class ScreenArguments {
  final String email;
  final String password;

  ScreenArguments(this.email, this.password);
}
