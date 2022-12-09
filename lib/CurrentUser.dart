// this file creates a current user object to track who is currently logged in

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CurrentUser{
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  final String email;
  final String id;
  final String bio;

  // current user constructor
  CurrentUser({
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.id,
    required this.bio,
  });

  // this method returns the current user information
  factory CurrentUser.fromDocument(DocumentSnapshot doc){
    return CurrentUser(
      id: doc['id'],
      email: doc['email'],
      password: doc['password'],
      firstName: doc['first name'],
      lastName: doc['last name'],
      bio: doc['bio'],
      username: doc['username'],
    );
  }
}