import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/catogories_screen.dart';
import 'package:movies_app/screens/downloads_screen.dart';
import 'package:movies_app/screens/movie_list_screen.dart';
import 'package:movies_app/screens/profile_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int pageIndex = 0;

  final pages = [
    const MovieList_Screen(),
    const Categories(),
    const Downloads(),
  ];
  void _updateIndex(int value) {
    setState(() {
      pageIndex = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: Colors.white),
        selectedItemColor: Colors.red[900],
        backgroundColor: Colors.black,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(

            icon: Icon(Icons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Watch List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save_alt),
            label: 'Downloads',
          ),
        ],
        currentIndex: pageIndex,
        onTap: _updateIndex,
      ),

    );

  }
}

