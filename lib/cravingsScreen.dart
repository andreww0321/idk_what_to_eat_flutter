/*  Names: Kenzie Kisthardt, Ellen Maguire, Batool Salloum, and Andrew White
    Description: Creates what the cravings screen will look like. Shows what the
    user can filter restaurants with in a check-list format
*/


import 'package:flutter/material.dart';

class cravingsScreen extends StatefulWidget {
    const cravingsScreen ({Key? key}) : super(key: key);
    @override
    DynamicallyCheckboxState createState() => DynamicallyCheckboxState();
}

class DynamicallyCheckboxState extends State{
    Map<String, bool> List = {
        "American" : false, // shows the list of the options the user is able
        "Italian" : false,  // to choose from, like cuisine, meal type, and the
        "Indian" : false,   // number of stars the restaurants has
        "Japanese" : false,
        "Mexican" : false,   // they are all set to false, aka the button is not
        "Chinese" : false,  // pressed/ checked by the user
        "Breakfast" : false,
        "Lunch" : false,
        "Dinner" : false,
        "Drinks" : false,
        r"*" : false,
        r"**" : false,
        r"***" : false,
        r"****" : false,
        r"*****" : false,
    };
    var holder1 = [];


    @override
    Widget build(BuildContext context){
        return Column(children: <Widget>[
            Container( // this container page title/header
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text( // setting name
                    'Select what you are craving',
                    style: TextStyle( // setting color, font size and wieght
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                )),
            Expanded(
                child: ListView(  // setting list of parliaments above for restaurant
                    children: List.keys.map((String key) { // restaurant specifications
                        return CheckboxListTile ( // in a check list format
                            title: Text(key),
                            value: List[key],
                            activeColor: Colors.blue, // changes colors of boxes
                            checkColor: Colors.white, // when pressed
                            onChanged: (value){
                                setState((){ // this allows the checkbox to be
                                    List[key] = value!; // checked or unchecked
                                    if(value == false){ // using a boolean
                                        holder1.remove(key);
                                    }else{
                                        holder1.add(key);
                                    }
                                });
                            },
                        );
                    }).toList(),
                ),
            ),
            ElevatedButton( // button to press to find restaurants
                onPressed: (null),
                style: ElevatedButton.styleFrom( // background of blue
                    disabledBackgroundColor: Colors.blue,
                ),
                child: const Text('Find Restaurants', // setting button name,
                    style: TextStyle(           // font size and color
                        fontSize: 20.0,
                        color: Colors.white,
                    )
                )
            )

        ],
        );
    }
}