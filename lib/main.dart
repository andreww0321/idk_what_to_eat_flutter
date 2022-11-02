//Names: Kenzie Kisthardt, Ellen Maguire, Batool Salloum, and Andrew White
//Description: Calls other classes to create app

// Imports the necessary packages for the app to run
import 'package:flutter/material.dart';
import 'package:idk_what_to_eat_test/signInScreenUI.dart';
import 'package:firebase_core/firebase_core.dart';

// The main function calls for the app to run
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());}

// The MyApp class sets up what the app looks like
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This sets up the app's title when you first open it
  static const String _title = 'IDK What To Eat';

  // The BuildContext builds what the main page will look like
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        // Calls the OpeningScreen to be the first page the user sees
        body: const OpeningScreen(),
      ),
    );
  }
}



