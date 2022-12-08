import 'package:flutter/material.dart';
import 'package:idk_what_to_eat_test/authentic.dart';
import 'package:idk_what_to_eat_test/CurrentUser.dart';

class Profile extends StatefulWidget {

  const Profile({super.key, required this.currentUser});
  final CurrentUser currentUser;
  @override
  State<Profile> createState() => _ProfileState();

}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
        child: Column(
            children: [
              Expanded(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
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
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child:Text("Username: " + widget.currentUser.username,
                  style: TextStyle(
                    fontSize: 20,
                  )
              )

          ),
        ),

  Expanded(
    child: Padding(
      padding:  EdgeInsets.fromLTRB(0, 40, 0, 0),
      child:Text("First Name: " + widget.currentUser.firstName,
          style: TextStyle(
            fontSize: 20,
          )
      )

  ),),
    Expanded(
                child: Padding(
                  padding:  EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child:Text("Last Name: " + widget.currentUser.lastName,
                      style: TextStyle(
                        fontSize: 20,
                      )
                  )

              ),),
       Expanded(
         child: Padding(
             padding:  EdgeInsets.fromLTRB(0, 40, 0, 0),
             child:Text("Email: " + widget.currentUser.email,
                 style: TextStyle(
                   fontSize: 20,
                 )
             )

         )
       )
            ]
        

      )
    ));
}
/*
return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Profile',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
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
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: username1Controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Current Username',
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: username2Controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'New Username',
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: password1Controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Current Password',
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: password2Controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'New Password',
                ),
              ),
            ),


            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Confirm'),
                  onPressed: () {
                    print(username2Controller.text);
                    print(password2Controller.text);
                  },
                )
            ),

          ],
        ));
 */