//Names: Kenzie Kisthardt, Ellen Maguire, Batool Salloum, and Andrew White
//Description: Creates what the sign in screen looks like

// Imports the necessary packages for the app to run
import 'package:flutter/material.dart';
import 'package:idk_what_to_eat_test/authentic.dart';
import 'package:idk_what_to_eat_test/signUpScreenUI.dart';
import 'package:idk_what_to_eat_test/homePageNavBar.dart';

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({Key? key}) : super(key: key);

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  final AuthService _auth = AuthService();
  String email ="";
  String password = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                  'Welcome!',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 20),
                )),
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

            const SizedBox(height: 20.0),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () async {
                    email = emailController.text;
                    password = passwordController.text;
                    dynamic result = await _auth.signIn(email, password);
                    if (result==null){
                      print('error signing in');
                    }
                    else {
                      print('signed in with email');
                      if(!mounted) return;
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return const BasicBottomNavBar(
                            title: 'BasicBottomNavBar');
                      }));
                    }
                  },
                ),
            ),

            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password',),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Don\'t  have an account?'),
                TextButton(
                  child: const Text(
                    'Register Now',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const signUpScreenUI(title: 'Sign Up!');
                    }));
                    //signup screen
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  child: const Text(
                    'Skip For Now ->',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () async {
                    // get result from sign in anon
                    dynamic result = await _auth.signInAnon();
                    if (result==null){
                      print('error signing in');
                    }
                    else {
                      print('signed in anon');
                      if (!mounted) return;
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const BasicBottomNavBar(
                            title: 'BasicBottomNavBar');
                      }));
                    }
                  },
                )
              ],
            ),
          ],
        ));
  }

}