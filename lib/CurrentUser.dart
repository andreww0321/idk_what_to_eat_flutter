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

  CurrentUser({
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.id,
    required this.bio,
  });

  factory CurrentUser.fromDocument(DocumentSnapshot doc){
    return CurrentUser(
      id: doc['id'],
      email: doc['username'],
      password: doc['password'],
      firstName: doc['first name'],
      lastName: doc['last name'],
      bio: doc['bio'],
      username: doc['username'],
    );
  }
}