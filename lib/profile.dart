import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idk_what_to_eat_test/authentic.dart';
import 'package:idk_what_to_eat_test/CurrentUser.dart';

// The profile class displays the user's information, such as their name, username, and password
class Profile extends StatefulWidget {

  // The constructor gets the currentUser information and sends it to the _ProfileState
  const Profile({super.key, required this.currentUser});
  final CurrentUser currentUser;
  @override
  State<Profile> createState() => _ProfileState();

}

// The _ProfileState class contains the widgets that make the profile information appear
class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();
  TextEditingController bioController = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
        child: Column(
            children: [
              Expanded(
                    // This displays the heading for the profile page
                    child:Text("Profile",
                        style: TextStyle(
                          fontSize: 50,
                          decoration: TextDecoration.underline,
                          color: Colors.black
                        )
                    )
              ),
        Expanded(
              // This displays the username for the user
              child:Text("Username: " + widget.currentUser.username,
                  style: TextStyle(
                    fontSize: 25,
                      color: Colors.blue
                  )
              )

          ),

  Expanded(
      // This displays the first name for the user
      child:Text("First Name: " + widget.currentUser.firstName,
          style: TextStyle(
            fontSize: 25,
              color: Colors.blue
          )
      )

  ),
    Expanded(
                  // This displays the last name for the user
                  child:Text("Last Name: " + widget.currentUser.lastName,
                      style: TextStyle(
                        fontSize: 25,
                          color: Colors.blue
                      )
                  )

              ),
       Expanded(
             // This displays the email for the user
             child:Text("Email: " + widget.currentUser.email,
                 style: TextStyle(
                   fontSize: 25,
                     color: Colors.blue
                 )
             )

         ),
  Expanded(
      child: Padding(
          padding:  EdgeInsets.only(left: 10, right: 10),
  // This displays the email for the user
  child:Text("Bio: " + widget.currentUser.bio,
  style: TextStyle(
  fontSize: 25,
      color: Colors.blue
  )
  )),),

              Expanded(
                  child: Padding(
                      padding:  EdgeInsets.all(5),
                      // This displays the email for the user
                      child:TextFormField(controller: bioController,
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.blue
      ),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Change your bio',
                              labelText: 'Bio',
                            ),
                          )
                      )


                  ),

  // This allows the user to update their bio
  Expanded(
  child: ElevatedButton(
  child: const Text('Change Bio'),
  onPressed: () async
  {
    final user = FirebaseFirestore.instance.collection("users").doc(widget.currentUser.id);
    String bioUpdate = bioController.text;
    user.update({"bio": bioUpdate});
}
),
)
            ]
        

      )
    ));
}

