import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/provider/categories_provider.dart';
import 'package:movies_app/provider/entry_provider.dart';
import 'package:movies_app/provider/home_provider.dart';
import 'package:movies_app/provider/movie_details_provider.dart';
import 'package:movies_app/provider/saved_provider.dart';
import 'package:movies_app/provider/search_movie_provider.dart';
import 'package:movies_app/provider/similiar_shows_provider.dart';
import 'package:movies_app/routes/class_route_names.dart';
import 'package:movies_app/routes/class_routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
bool? auth;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preferences=await SharedPreferences.getInstance();
  auth= preferences.getBool('IsLoggedIn')??false;
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<EntryProvider>(create: (context)=>EntryProvider()),
        ChangeNotifierProvider<HomeProvider>(create: (context)=>HomeProvider()),
        ChangeNotifierProvider<CategoriesProvider>(create: (context)=>CategoriesProvider()),
        ChangeNotifierProvider<MovieDetailsProvider>(create: (context)=>MovieDetailsProvider()),
        ChangeNotifierProvider<SearchMovieProvider>(create: (context)=>SearchMovieProvider()),
        ChangeNotifierProvider<SimiliarShowsProvider>(create: (context)=>SimiliarShowsProvider()),
        ChangeNotifierProvider<SavedProvider>(create: (context)=>SavedProvider()),

  ],
      child:Main()));


}
class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      initialRoute: auth==true?RouteName.homeRoute:RouteName.loginRoute,
      onGenerateRoute: RouteClass.generateRoute,
      theme: ThemeData(appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent,elevation: 0,)),
    );
  }
}
