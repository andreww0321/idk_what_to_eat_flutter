//Names: Kenzie Kisthardt, Ellen Maguire, Batool Salloum, and Andrew White
//Description: Creates what the sign in screen looks like

// Imports the necessary packages for the app to run
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:idk_what_to_eat_test/CurrentUser.dart';
import 'package:idk_what_to_eat_test/authentic.dart';
import 'package:idk_what_to_eat_test/myUser.dart';
import 'package:idk_what_to_eat_test/signUpScreenUI.dart';
import 'package:idk_what_to_eat_test/homePageNavBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idk_what_to_eat_test/profile.dart';

final userRef = FirebaseFirestore.instance.collection('users');

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
    return Scaffold(
        body: Column(
          children: <Widget>[
            const SizedBox(height: 40.0),
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
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Invalid Login Credentials")));
                    }
                    else {
                      createUserInFirestore();
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
          ],
        ));
  }

  createUserInFirestore() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await usersRef.doc(user.uid).get();
      if (!doc.exists){
        doc = await usersRef.doc(user.uid).get();
        var currentUser = CurrentUser.fromDocument(doc);
        print(currentUser.username);
      }
      else{
        var currentUser = CurrentUser.fromDocument(doc);
        print(currentUser.username);
        print(currentUser.firstName);
        print(currentUser.lastName);
        print('signed in with email');
        if(!mounted) return;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Profile(currentUser: currentUser),
          ),
        );
        Navigator.push(
            context, MaterialPageRoute(builder: (context) {
          return BasicBottomNavBar(
              title: 'BasicBottomNavBar',
          currentUser: currentUser);
        }));
      }
      // User is signed in
    } else {
      print("No user");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const signUpScreenUI(title: 'Sign Up!');
      }));
      // No user is signed in
    }
  }

}