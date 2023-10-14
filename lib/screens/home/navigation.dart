import 'package:flutter/material.dart';
import 'package:movies_app/provider/home_provider.dart';
import 'package:movies_app/utilities/helper_function.dart';
import 'package:provider/provider.dart';

import 'categories_screen.dart';
import 'watchlist_screen.dart';
import 'home_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  final pages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const WatchListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final screenProvider=Provider.of<HomeProvider>(context);
    int currentIndex=screenProvider.fetchCurrentIndex;
    return WillPopScope(
      onWillPop:()=> Helper.onWillPop(context),
      child: Scaffold(

        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          unselectedLabelStyle: const TextStyle(color: Colors.white),
          selectedItemColor: Colors.red[900],
          backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.save_alt),
              label: 'Watch List',
            ),
          ],
          currentIndex: currentIndex,
          onTap:(value)=>screenProvider.updateScreenIndex(value),
        ),
      ),
    );
  }
}
