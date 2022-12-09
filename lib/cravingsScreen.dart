/*  Names: Kenzie Kisthardt, Ellen Maguire, Batool Salloum, and Andrew White
    Description: Creates what the cravings screen will look like. Shows what the
    user can filter restaurants with in a check-list format
*/
// Imports the necessary packages for the app to run
import 'dart:core';
import 'package:flutter/material.dart';



class cravingsScreen extends StatefulWidget {
    const cravingsScreen ({Key? key}) : super(key: key);
    @override
    State<cravingsScreen> createState() => _cravingsPageState();
}

class _cravingsPageState extends State<cravingsScreen> {
    bool isChecked1 = false;  // boolean values set to false
    bool isChecked2 = false;  // these bool values will correspond with the
    bool isChecked3 = false;  // items you can check
    bool isChecked4 = false;
    bool isChecked5 = false;
    bool isChecked6 = false;
    bool isChecked7 = false;
    bool isChecked8 = false;
    bool isChecked9 = false;
    bool isChecked10 = false;
    bool isChecked11 = false;
    bool isChecked12 = false;
    bool isChecked13 = false;
    bool isChecked14 = false;
    bool isChecked15 = false;


    @override
    Widget build(BuildContext context) {
        return Column(children: <Widget>[
            Container( // this container page title/header
                alignment: Alignment.center, // centering container
                padding: const EdgeInsets.all(10),
                child: const Text( // setting title of page
                    'Select what you are craving?',
                    style: TextStyle(
                        color: Colors.black, // setting color to black
                        fontWeight: FontWeight.w500, // font thickness/ weight
                        fontSize: 30),// set font size
                )),
            const Divider( // a blue divider for visual purposes
                color: Colors.blue,
                thickness: 15,
            ),
            Expanded(
                child: ListView( // listview allows for the checked boxes to scroll
                    children: [
                    CheckboxListTile( // this creates one single checkbox and a label/title for that box
                    controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                    title: const Text('American'), // this is the main label for the American checkbox
                    value: isChecked1,
                    onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                        setState(() => isChecked1 = value!);
                    },
                    activeColor: Colors.blue, // fill color of checkbox when selected
                    checkColor: Colors.white, // color of check mark when checkbox is selected
                ),
                    CheckboxListTile( // this creates one single checkbox and a label/title for that box
                    controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                    title: const Text('Italian'), // this is the main label for the Italian checkbox
                    value: isChecked2,
                    onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                        setState(() => isChecked2 = value!);
                    },
                    activeColor: Colors.blue, // fill color of checkbox when selected
                    checkColor: Colors.white, // color of check mark when checkbox is selected
                ),
                CheckboxListTile( // this creates one single checkbox and a label/title for that box
                    controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                    title: const Text('Indian'), // this is the main label for the Indian checkbox
                    value: isChecked3,
                    onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                        setState(() => isChecked3 = value!);
                    },
                    activeColor: Colors.blue, // fill color of checkbox when selected
                    checkColor: Colors.white, // color of check mark when checkbox is selected
                ),
                CheckboxListTile( // this creates one single checkbox and a label/title for that box
                    controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                    title: const Text('Japanese'), // this is the main label for the Japanese checkbox
                    value: isChecked4,
                    onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                        setState(() => isChecked4 = value!);
                    },
                    activeColor: Colors.blue, // fill color of checkbox when selected
                    checkColor: Colors.white, // color of check mark when checkbox is selected
                ),
                CheckboxListTile( // this creates one single checkbox and a label/title for that box
                    controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                    title: const Text('Mexican'), // this is the main label for the Mexican checkbox
                    value: isChecked5,
                    onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                        setState(() => isChecked5 = value!);
                    },
                    activeColor: Colors.blue, // fill color of checkbox when selected
                    checkColor: Colors.white, // color of check mark when checkbox is selected
                ),
                CheckboxListTile( // this creates one single checkbox and a label/title for that box
                    controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                    title: const Text('Chinese'), // this is the main label for the Chinese checkbox
                    value: isChecked6,
                    onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                        setState(() => isChecked6 = value!);
                    },
                    activeColor: Colors.blue, // fill color of checkbox when selected
                    checkColor: Colors.white, // color of check mark when checkbox is selected
                ),
                CheckboxListTile( // this creates one single checkbox and a label/title for that box
                    controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                    title: const Text('Breakfast'), // this is the main label for the Breakfast checkbox
                    value: isChecked7,
                    onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                        setState(() => isChecked7 = value!);
                    },
                    activeColor: Colors.blue, // fill color of checkbox when selected
                    checkColor: Colors.white, // color of check mark when checkbox is selected
                ),
                CheckboxListTile( // this creates one single checkbox and a label/title for that box
                    controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                    title: const Text('Lunch'), // this is the main label for the Lunch checkbox
                    value: isChecked8,
                    onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                        setState(() => isChecked8 = value!);
                    },
                    activeColor: Colors.blue, // fill color of checkbox when selected
                    checkColor: Colors.white, // color of check mark when checkbox is selected
                ),
                CheckboxListTile( // this creates one single checkbox and a label/title for that box
                    controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                    title: const Text('Dinner'), // this is the main label for the Dinner checkbox
                    value: isChecked9,
                    onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                        setState(() => isChecked9 = value!);
                    },
                    activeColor: Colors.blue, // fill color of checkbox when selected
                    checkColor: Colors.white, // color of check mark when checkbox is selected
                ),
                CheckboxListTile( // this creates one single checkbox and a label/title for that box
                    controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                    title: const Text('Drinks'), // this is the main label for the Drinks checkbox
                    value: isChecked10,
                    onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                        setState(() => isChecked10 = value!);
                    },
                    activeColor: Colors.blue, // fill color of checkbox when selected
                    checkColor: Colors.white, // color of check mark when checkbox is selected
                ),
                CheckboxListTile( // this creates one single checkbox and a label/title for that box
                    controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                    title: const Text('*'), // this is the main label for the * checkbox
                    value: isChecked11,
                    onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                        setState(() => isChecked11 = value!);
                    },
                    activeColor: Colors.blue, // fill color of checkbox when selected
                    checkColor: Colors.white, // color of check mark when checkbox is selected
                ),
                CheckboxListTile( // this creates one single checkbox and a label/title for that box
                    controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                    title: const Text('**'), // this is the main label for the ** checkbox
                    value: isChecked12,
                    onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                        setState(() => isChecked12 = value!);
                    },
                    activeColor: Colors.blue, // fill color of checkbox when selected
                    checkColor: Colors.white, // color of check mark when checkbox is selected
                ),
                CheckboxListTile( // this creates one single checkbox and a label/title for that box
                    controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                    title: const Text('***'), // this is the main label for the *** checkbox
                    value: isChecked13,
                    onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                        setState(() => isChecked13 = value!);
                    },
                    activeColor: Colors.blue, // fill color of checkbox when selected
                    checkColor: Colors.white, // color of check mark when checkbox is selected
                ),
                CheckboxListTile( // this creates one single checkbox and a label/title for that box
                    controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                    title: const Text('****'), // this is the main label for the **** checkbox
                    value: isChecked14,
                    onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                        setState(() => isChecked14 = value!);
                    },
                    activeColor: Colors.blue, // fill color of checkbox when selected
                    checkColor: Colors.white, // color of check mark when checkbox is selected
                ),
                CheckboxListTile( // this creates one single checkbox and a label/title for that box
                    controlAffinity: ListTileControlAffinity.leading, // this controls the position of the label relative to the checkbox
                    title: const Text('*****'), // this is the main label for the ***** checkbox
                    value: isChecked15,
                    onChanged: (value) { // this allows the checkbox to be checked or unchecked using a boolean value
                        setState(() => isChecked15 = value!);
                    },
                    activeColor: Colors.blue, // fill color of checkbox when selected
                    checkColor: Colors.white, // color of check mark when checkbox is selected
                ),
                        const Divider( // a blue divider for visual purposes
                            color: Colors.blue,
                            thickness: 5,
                        ),
               Container( // container that displays results
                   width: double.infinity,
                   height: 100,
                   child: Center(
                       child: Text(results() ?? ' ', // calling results method
                           textAlign: TextAlign.center,
                           style: const TextStyle( // font size and color
                               fontSize: 35.0,
                               color: Colors.black87,
                           ),
                       ),// setting button name,
                   ),

               )
            ]
            ),
            ),

            Container( // container that displays results
                width: double.infinity,
                height: 100,
                child: Center(
                    child: ElevatedButton(
                            onPressed: (){
                                Text(results() ?? ' '); // calling results method
                                },
                         // button to press to find restaurants
                            style: ElevatedButton.styleFrom( // background of blue
                            disabledBackgroundColor: Colors.blue,
                        ),
                        child: const Text(
                            'Find Restaurants', // setting button name,
                            style: TextStyle( // font size and color
                                fontSize: 20.0,
                                color: Colors.white,
                            )
                        )
                    ),
                ),
            ),],
        );
    }


    // this method displays a string and if certain values/ checked box are checked
    // then outputs a restaurant in the container. This is hard coded for 5
    // different restaurants for the highly functional

    String? results() {  // if the american, breakfast, 5 star boxes are checked
        if(isChecked1 == true && isChecked2 == false  && isChecked3 == false && isChecked4 == false && isChecked5 == false
            && isChecked6 == false && isChecked7 == true && isChecked8 == false && isChecked9 == false && isChecked10 == false
            && isChecked11 == false && isChecked12 == false && isChecked13 == false && isChecked14 == false && isChecked15 == true) {
            return "Restaurant name:\n Greg\'s Kitchen";} // returns this

        //  if the Japanese, lunch, 4 star boxes are checked
        else if (isChecked1 == false && isChecked2 == false  && isChecked3 == false && isChecked4 == true && isChecked5 == false
            && isChecked6 == false && isChecked7 == false && isChecked8 == true && isChecked9 == false && isChecked10 == false
            && isChecked11 == false && isChecked12 == false && isChecked13 == false && isChecked14 == true && isChecked15 == false) {
            return "Restaurant name:\n Ten Asian Food Hall";} // returns this

        // if the drinks, 4 star boxes are checked
        else if (isChecked1 == false && isChecked2 == false  && isChecked3 == false && isChecked4 == false && isChecked5 == false
            && isChecked6 == false && isChecked7 == false && isChecked8 == false && isChecked9 == false && isChecked10 == true
            && isChecked11 == false && isChecked12 == false && isChecked13 == false && isChecked14 == true && isChecked15 == false) {
            return "Bar:\n Varga Bar";} // returns this

        // if the italian, lunch, dinner, 3 star, boxes are checked
        else if (isChecked1 == false && isChecked2 == true  && isChecked3 == false && isChecked4 == false && isChecked5 == false
            && isChecked6 == false && isChecked7 == false && isChecked8 == true && isChecked9 == true && isChecked10 == false
            && isChecked11 == false && isChecked12 == false && isChecked13 == true && isChecked14 == false && isChecked15 == false) {
            return "Restaurant name:\n Stacy\'s Pizza";} // returns this

        //if the mexican, lunch, dinner, 5 star, boxes are checked
        else if (isChecked1 == false && isChecked2 == false  && isChecked3 == false && isChecked4 == false && isChecked5 == true
            && isChecked6 == false && isChecked7 == false && isChecked8 == true && isChecked9 == true && isChecked10 == false
            && isChecked11 == false && isChecked12 == false && isChecked13 == false && isChecked14 == false && isChecked15 == true) {
            return "Restaurant name:\n El Taco";} // returns this
    }
}