import 'package:flutter/material.dart';
import 'package:movies_app/screens/login_screen.dart';
import 'package:movies_app/screens/movie_play_screen.dart';
import 'package:movies_app/screens/series_play_screen.dart';
import 'package:movies_app/screens/user_screen.dart';
void main(){
  runApp(Main());
}
class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
       home: LoginScreen(),
    );
  }
}
