//Names: Kenzie Kisthardt, Ellen Maguire, Batool Salloum, and Andrew White
//Description: Creates what the sign in screen looks like

// Imports the necessary packages for the app to run
import 'package:flutter/material.dart';
import 'package:idk_what_to_eat_test/authentic.dart';
import 'homePageNavBar.dart';

class signUpScreenUI extends StatefulWidget {
  const signUpScreenUI({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  // Sets the opening screen state to the OpeningScreenState class
  State<signUpScreenUI> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<signUpScreenUI> {
  final AuthService _auth = AuthService();
  String email = "";
  String password = "";

  // Creates controllers, one for username, password, first name, last name, and email
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // The BuildContext builds what the sign in page will look like
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
        ),
      body: Hero(
        tag: const EdgeInsets.all(10),
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
                  'Sign up',
                  style: TextStyle(fontSize: 20),
                )),

            // Creates container for username
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: userNameController,
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

            // Creates container for first name
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                ),
              ),
            ),

            // Creates container for last name
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
              ),
            ),

            // Creates container for email
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),

            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () async {
                    email = emailController.text;
                    password = passwordController.text;
                    dynamic result = await _auth.registerUser(email.trim(), password);
                    if (result == null){
                      print(email);
                      print('error registering');
                    }
                    else {
                      if (!mounted) return;
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return const BasicBottomNavBar(
                            title: 'BasicBottomNavBar');
                      }));
                    }
                  },
                )
            ),
            // Creates option to skip signing in (this may be removed in the final app version, TBD)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
            ),
          ],
        )));
  }
}