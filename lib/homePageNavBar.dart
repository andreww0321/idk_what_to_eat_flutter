//Names: Kenzie Kisthardt, Ellen Maguire, Batool Salloum, and Andrew White
//Description: Creates what the bottom navigation bar looks like

// Imports the necessary packages for the app to run

import 'package:flutter/material.dart';
import 'package:idk_what_to_eat_test/cravingsScreen.dart';
import 'package:idk_what_to_eat_test/profile.dart';
import 'package:idk_what_to_eat_test/CurrentUser.dart';
import 'package:idk_what_to_eat_test/randomPage.dart';
import 'uploadScreen.dart';

class BasicBottomNavBar extends StatefulWidget {
  const BasicBottomNavBar({Key? key, required this.title, required this.currentUser}) : super(key: key, );
  final String title;
  final CurrentUser currentUser;
  @override

  _BasicBottomNavBarState createState() => _BasicBottomNavBarState();
}

class _BasicBottomNavBarState extends State<BasicBottomNavBar> {
  int _selectedIndex = 0;
  late CurrentUser user = widget.currentUser;

  late final List<Widget> _pages = <Widget>[
    Icon(
      Icons.home,
      size: 150,
    ),
    randomPage(),
    cravingsScreen(),
    uploadScreen(),
    Profile(currentUser: user),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign out'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
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