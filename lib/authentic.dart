/*  Names: Kenzie Kisthardt, Ellen Maguire, Batool Salloum, and Andrew White
    Description: This file authenticates that the user has an account with our app
*/

// Imports the necessary packages for the app to run
import 'package:firebase_auth/firebase_auth.dart';
import 'package:idk_what_to_eat_test/myUser.dart';
import 'package:idk_what_to_eat_test/signUpScreenUI.dart';

class AuthService {

  signUpScreenUI signUpScreen = signUpScreenUI(title: 'Sign Up');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FireBaseUser
  MyUser? _userFromFirebseUser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebseUser(user);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebseUser(user);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register
  Future registerUser(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebseUser(user);
    }
    catch (e) {
      print(e.toString());
      return null;
    }

    // sign out
  }
}
