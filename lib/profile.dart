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

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
        child: Column(
            children: [
              Expanded(
                child: Padding(
                    padding: EdgeInsets.all(40),
                    // This displays the heading for the profile page
                    child:Text("Profile",
                        style: TextStyle(
                          fontSize: 50,
                          decoration: TextDecoration.underline,
                          color: Colors.blue
                        )
                    )

                ),
              ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(20),
              // This displays the username for the user
              child:Text("Username: " + widget.currentUser.username,
                  style: TextStyle(
                    fontSize: 30,
                  )
              )

          ),
        ),

  Expanded(
    child: Padding(
      padding:  EdgeInsets.all(20),
      // This displays the first name for the user
      child:Text("First Name: " + widget.currentUser.firstName,
          style: TextStyle(
            fontSize: 30,
          )
      )

  ),),
    Expanded(
                child: Padding(
                  padding:  EdgeInsets.all(20),
                  // This displays the last name for the user
                  child:Text("Last Name: " + widget.currentUser.lastName,
                      style: TextStyle(
                        fontSize: 30,
                      )
                  )

              ),),
       Expanded(
         child: Padding(
             padding:  EdgeInsets.all(20),
             // This displays the email for the user
             child:Text("Email: " + widget.currentUser.email,
                 style: TextStyle(
                   fontSize: 30,
                 )
             )

         )
       )
            ]
        

      )
    ));
}
