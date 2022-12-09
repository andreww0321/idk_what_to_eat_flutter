

import 'dart:ffi';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


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
  final List resultsArray= [];

  Future<List> getData() async {

    FirebaseFirestore.instance.collection('restaurants').get().then((value) =>
    {value.docs.forEach((result) {
        resultsArray.add((result.get('name') as String) + ("\n\nADDRESS:\n") + (result.get('address') as String)+ ("\n\nCATEGORIES:\n") + (result.get('categories') as String) + ("\n\nSTARS:\n") + (result.get('stars').toString()));
        // if (i == randInt) {
        //   randomRes = result.get('name') as String;
        //   //resultsArray.add(result.toString());
        //   print(randomRes);
        //   i++;
        // }
      })
    });
    return resultsArray;
  }

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Find a Place to Eat Even If You Don\'t Know What Your Craving!',
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
              padding: const EdgeInsets.fromLTRB(30, 10, 2, 10),
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
                            title: const Text('Use my current location', style: TextStyle(fontSize: 25), textAlign: TextAlign.left), // this is the main label for the checkbox
                            // subtitle: const Text('Subtitle...'), // subtitle for main label in checkbox
                            value: isChecked1,
                            onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                              setState(() => isChecked1 = value!);
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
              padding: const EdgeInsets.fromLTRB(30, 10, 2, 10),
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
                            title: const Text('Use my dietary restrictions', style: TextStyle(fontSize: 25), textAlign: TextAlign.left), // this is the main label for the checkbox
                            // subtitle: const Text('Subtitle...'), // subtitle for main label in checkbox
                            value: isChecked3,
                            onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                              setState(() => isChecked3 = value!);
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
                onPressed: () async {
                  List result = await getData();
                  print(result.length);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return randomResults(title: 'Restaurants Found For You', restaurant: result);
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
    ),
    //Center//Center
  );

}

//------------------------------------------------------------------------------>
// Create the screen which displays the restaurants

class randomResults extends StatefulWidget {


  randomResults({Key? key, required String title, required this.restaurant}) :super(key: key);
  List restaurant;

  @override
  // Sets the opening screen state to the OpeningScreenState class
  State<randomResults> createState() => _randomResultsState();
}

class _randomResultsState extends State<randomResults> {

  @override
  Widget build(BuildContext context) {
    String text = "";
    if (widget.restaurant.length>0) {
      var randInt = Random().nextInt(widget.restaurant.length);
       text = ("RESTAURANT NAME: \n" +widget.restaurant.elementAt(randInt));
    }
    else{
      text = "Loading...";
    }

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
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child:Text(text,
                            style: TextStyle(
                              fontSize: 30,
                            )
                        )

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

  // Future<String> getData() async {
  //   String randomRes = "";
  //   // var resultsArray = [];
  //   var i = 0;
  //   var randInt = Random().nextInt(3);
  //   FirebaseFirestore.instance.collection('restaurants').get().then((value) =>
  //   {
  //     value.docs.forEach((result) {
  //       if (i == randInt) {
  //         randomRes = result.get('name') as String;
  //         //resultsArray.add(result.toString());
  //         print(randomRes);
  //         i++;
  //       }
  //     })
  //   });
  //   return randomRes;
  // }
}

/*
String getData() {
  int length = 100;
  int iterator = 0;
  var resultsArray = [];

  var randInt = Random().nextInt(length);
  FirebaseFirestore.instance.collection('restaurants').get().then((value) => {
    value.docs.forEach((result){
      resultsArray.add(result.data());
      print("");
      print(result.data().toString());
      /*if (iterator == randInt) {
        print(result.data());
        resultsArray.add(result.data().toString());
      }
      else {
        result.data();
        iterator++;
      }

       */
    })
  });
  return resultsArray[0];
}

 */



