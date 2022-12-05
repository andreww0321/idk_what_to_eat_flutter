import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CurrentRestaurant{
  final String id;
  final String address;
  final String businessId;
  final String categories;
  final String city;
  final String hours;
  final String name;
  final String postalCode;
  final int stars;
  final String state;

  CurrentRestaurant({
    required this.id,
    required this.address,
    required this.businessId,
    required this.categories,
    required this.city,
    required this.hours,
    required this.name,
    required this.postalCode,
    required this.stars,
    required this.state
  });

  factory CurrentRestaurant.fromDocument(DocumentSnapshot doc){
    return CurrentRestaurant(
      id: doc['id'],
      address: doc['address'],
      businessId: doc['businessId'],
      categories: doc['categories'],
      city: doc['city'],
      hours: doc['hours'],
      name: doc['name'],
      postalCode: doc['postalCode'],
      stars: doc['stars'],
      state: doc['state'],
    );
  }
}