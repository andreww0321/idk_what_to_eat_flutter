//Names: Kenzie Kisthardt, Ellen Maguire, Batool Salloum, and Andrew White
//Description: Creates what the bottom navigation bar looks like

// Imports the necessary packages for the app to run

import 'package:flutter/material.dart';
import 'package:idk_what_to_eat_test/cravingsScreen.dart';
import 'package:idk_what_to_eat_test/profile.dart';
import 'package:idk_what_to_eat_test/CurrentUser.dart';
import 'package:idk_what_to_eat_test/randomPage.dart';
import 'uploadScreen.dart';
import 'package:idk_what_to_eat_test/timeline.dart';

// The BasicBottomNavBar class creates the variables for the navigation bar
class BasicBottomNavBar extends StatefulWidget {
  const BasicBottomNavBar({Key? key, required this.title, required this.currentUser}) : super(key: key, );
  final String title; // The title shown on the app's header
  final CurrentUser currentUser; // The current user's information
  @override

  _BasicBottomNavBarState createState() => _BasicBottomNavBarState();
}

// The _BasicBottomNavBarState creates the widgets for the BasicBottomNavBar
class _BasicBottomNavBarState extends State<BasicBottomNavBar> {
  int _selectedIndex = 0; // This controls which page is shown on the app
  late CurrentUser user = widget.currentUser; // The current user's information

  // This list calls all the other pages
  late final List<Widget> _pages = <Widget>[
    timeline(),
    randomPage(),
    cravingsScreen(),
    uploadScreen(),
    Profile(currentUser: user)
  ];

  // The _onItemTapped method controls which page on the app is shown
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // This controls the text shown on the header
        title: const Text('Sign out'),
      ),
      // This puts whatever page the selectedIndex has on the center of the app screen
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),

      // This creates the bottom navigation bar with icons for each page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: 'Random',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Cravings',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            label: 'Upload',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}