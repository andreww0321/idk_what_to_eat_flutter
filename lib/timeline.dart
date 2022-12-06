import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idk_what_to_eat_test/post.dart';

class timeline extends StatefulWidget {
  const timeline({Key? key}) : super(key: key);

  @override
  State<timeline> createState() => _timelineState();
}

class _timelineState extends State<timeline> {
  List<Post>? posts=null;
  final timelineRef = FirebaseFirestore.instance.collection('posts');
  
  @override
  void initState(){
    super.initState();
    getTimeline();
  }

  getTimeline() async{
    QuerySnapshot snapshot = await timelineRef.orderBy('timestamp', descending: true).get();
    List<Post> post = snapshot.docs.map((doc) => Post.fromDocument(doc)).toList();
    setState(() {
      posts = post;
    });
  }

  buildTimeline() {
    if (posts==null){
      return Text("Fetching Posts...");
    }
    else if (posts!.isEmpty){
      return Text("No Posts to Show!");
    }
    else {
      return ListView(children: posts!);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => getTimeline(),
        child: buildTimeline(),
      )
    );
  }
}
