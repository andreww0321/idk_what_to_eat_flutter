//Names: Kenzie Kisthardt, Ellen Maguire, Batool Salloum, and Andrew White
//Description: Creates what the bottom navigation bar looks like

// Imports the necessary packages for the app to run
import 'package:flutter/material.dart';

class BasicBottomNavBar extends StatefulWidget {
  const BasicBottomNavBar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _BasicBottomNavBarState createState() => _BasicBottomNavBarState();
}

class _BasicBottomNavBarState extends State<BasicBottomNavBar> {
  int _selectedIndex = 0; // the button on the navigation bar that is selected (0 is for home)

  // This section creates all the icons for the navigation bar and their sizes
  static const List<Widget> _pages = <Widget>[
    Icon(
      Icons.house,
      size: 150,
    ),
    Icon(
      Icons.question_mark,
      size: 150,
    ),
    Icon(
      Icons.article_outlined,
      size: 150,
    ),
    Icon(
      Icons.add_a_photo,
      size: 150,
    ),
    Icon(
      Icons.account_circle,
      size: 150,
    ),
    // Icon(
    //   Icons.chat,
    //   size: 150,
    // ),
  ];

  // This section changes the selectedIndex value based on what button on the navigation bar has been hit
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // The BuildContext builds what the navigation bar will look like
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // This sets up the title of the BottomNavigationBar
        title: const Text('BottomNavigationBar Demo'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // This creates the icons, color, and label of all the navigation bar buttons
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