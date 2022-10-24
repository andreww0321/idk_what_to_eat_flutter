//Names: Kenzie Kisthardt, Ellen Maguire, Batool Salloum, and Andrew White
//Description: Creates what the sign in screen looks like

// Imports the necessary packages for the app to run
import 'package:flutter/material.dart';
import 'homePageNavBar.dart';

class signUpScreenUI extends StatefulWidget {
  const signUpScreenUI({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  // Sets the opening screen state to the OpeningScreenState class
  State<signUpScreenUI> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<signUpScreenUI> {
  // Creates two controllers, one for name and one for password
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // The BuildContext builds what the sign in page will look like
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '...',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),

            // Creates container for username
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),

            // Creates container for password
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),

            // Creates container for forgot password
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Get Rid Of',),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                )
            ),
            // Creates option to skip signing in (this may be removed in the final app version, TBD)
            Row(
              children: <Widget>[
                TextButton(
                  child: const Text(
                    'Skip For Now ->',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const BasicBottomNavBar(title: 'BasicBottomNavBar');
                    }));
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}