// this file creates post objects
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final String postId;
  final String restaurantName;
  final String caption;
  final String mediaUrl;

  // post object constructor
  const Post({super.key,
    required this.postId,
    required this.restaurantName,
    required this.mediaUrl,
    required this.caption,
  });

  // returns post object with all according information from firestore
  factory Post.fromDocument(DocumentSnapshot doc){
    return Post(
      postId: doc['postId'],
      restaurantName: doc['restaurantName'],
      caption: doc['caption'],
      mediaUrl: doc['mediaUrl'],
    );
  }

  @override
  State<Post> createState() => _PostState(
    postId: this.postId,
    restaurantName: this.restaurantName,
    caption: this.caption,
    mediaUrl: this.mediaUrl
  );
}

class _PostState extends State<Post> {
  final String postId;
  final String restaurantName;
  final String caption;
  final String mediaUrl;

  // Post state constructor
  _PostState({
    required this.postId,
    required this.restaurantName,
    required this.mediaUrl,
    required this.caption,
  });

  // Restuarant name of post UI
  buildPostHeader(){
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 40.0, left: 20.0)),
            Text("Restaurant: " + restaurantName, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        )
      ],
    );
  }

  // Image section of post UI
  buildPostImage(){
    return Column(
      mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 0.0, right: 0.0)),
          Image.network(mediaUrl),
        ],
    );
  }

  // caption section of post UI
buildPostFooter(){
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 40.0, left: 20.0)),
            Text("Caption: " + caption),
          ],
        )
      ],
    );
  }

  // Display post UI
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildPostHeader(),
        buildPostImage(),
        buildPostFooter(),
        Divider(
          color: Colors.blueAccent, //color of divider
          height: 5, //height spacing of divider
          thickness: 10, //thickness of divier line
        )
      ],
    );
  }
}
