import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'homePageNavBar.dart';


class randomPage extends StatefulWidget {
  const randomPage({Key? key}) : super(key: key);

  @override
  // Sets the opening screen state to the OpeningScreenState class
  State<randomPage> createState() => _randomPageState();
}

class _randomPageState extends State<randomPage> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;

  @override
  //App widget tree
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Divider(
                color: Colors.blue,
                thickness: 15,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Find a Place to Eat, Even If You Don\'t Know What You\'re Craving!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            Divider(
              color: Colors.blue,
              thickness: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Divider(
                color: Colors.blue,
                thickness: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 10, 3, 10),
              child: Row(
                children: [
                  Icon(Icons.location_on,
                    color: Colors.black, // dark grey
                    size: 100,
                  ),
                  Expanded(
                    child: Column(
                        children: [

                          CheckboxListTile( // this creates one single checkbox and a label/title for that box
                            controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                            // secondary: const Icon(Icons.question_mark), // this allows you to add another element to diplay next to the label
                            title: const Text('Use my current location'), // this is the main label for the checkbox
                            // subtitle: const Text('Subtitle...'), // subtitle for main label in checkbox
                            value: isChecked1,
                            onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                              setState(() => isChecked1 = value!);
                            },
                            activeColor: Colors.blue, // fill color of checkbox when selected
                            checkColor: Colors.white, // color of check mark when checkbox is selected
                          ),
                          CheckboxListTile( // this creates one single checkbox and a label/title for that box
                            controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                            //secondary: const Icon(Icons.question_mark), // this allows you to add another element to diplay next to the label
                            title: const Text('Use my home address'), // this is the main label for the checkbox
                            //subtitle: const Text('Subtitle...'), // subtitle for main label in checkbox
                            value: isChecked2,
                            onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                              setState(() => isChecked2 = value!);
                            },
                            activeColor: Colors.blue, // fill color of checkbox when selected
                            checkColor: Colors.white, // color of check mark when checkbox is selected
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 10, 3, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.no_food_outlined,
                    color: Colors.black, // dark grey
                    size: 100,
                  ),
                  Expanded(
                    child: Column(
                        children: [
                          CheckboxListTile( // this creates one single checkbox and a label/title for that box
                            controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                            //secondary: const Icon(Icons.question_mark), // this allows you to add another element to diplay next to the label
                            title: const Text('Use my dietary restrictions'), // this is the main label for the checkbox
                            // subtitle: const Text('Subtitle...'), // subtitle for main label in checkbox
                            value: isChecked3,
                            onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                              setState(() => isChecked3 = value!);
                            },
                            activeColor: Colors.blue, // fill color of checkbox when selected
                            checkColor: Colors.white, // color of check mark when checkbox is selected
                          ),
                          CheckboxListTile( // this creates one single checkbox and a label/title for that box
                            controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                            //secondary: const Icon(Icons.question_mark), // this allows you to add another element to diplay next to the label
                            title: const Text('Do not use my dietary restrictions'), // this is the main label for the checkbox
                            //subtitle: const Text('Subtitle...'), // subtitle for main label in checkbox
                            value: isChecked4,
                            onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                              setState(() => isChecked4 = value!);
                            },
                            activeColor: Colors.blue, // fill color of checkbox when selected
                            checkColor: Colors.white, // color of check mark when checkbox is selected
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.blue,
              thickness: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Divider(
                color: Colors.blue,
                thickness: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 10, 3, 10),
              child: ElevatedButton(
                onPressed: () {
                  getData();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const randomResults(title: 'Restaurants Found For You');
                  }));
                },
                child: const Text(
                  'Find Restaurants',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Divider(
              color: Colors.blue,
              thickness: 15,
            ),
          ]),//Checkbox//Column
    ), //Center//Center
  );
}
//------------------------------------------------------------------------------>
// Create the screen which displays the restaurants

class randomResults extends StatefulWidget {
  const randomResults({Key? key, required String title}) : super(key: key);

  @override
  // Sets the opening screen state to the OpeningScreenState class
  State<randomResults> createState() => _randomResultsState();
}

class _randomResultsState extends State<randomResults> {

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          body: Center(
              child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: Divider(
                        color: Colors.blue,
                        thickness: 15,
                      ),),
                    Divider(
                      color: Colors.blue,
                      thickness: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Divider(
                        color: Colors.blue,
                        thickness: 15,
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('Try Again'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Divider(
                      color: Colors.blue,
                      thickness: 15,
                    ),

                  ]
              )
          )
      );
  }
}

void getData() {
  int length = 100;
  int iterator = 0;
  var randInt = Random().nextInt(length);
  FirebaseFirestore.instance.collection('restaurants').get().then((value) => {
    value.docs.forEach((result){
      if (iterator == randInt) {
        print(result.data());
      }
      else {
        result.data();
        iterator++;
      }
    })
  });
}
