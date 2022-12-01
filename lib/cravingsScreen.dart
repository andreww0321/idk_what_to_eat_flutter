//Names: Kenzie Kisthardt, Ellen Maguire, Batool Salloum, and Andrew White
//Description: Creates what the cravings screen will look like


import 'package:flutter/material.dart';

class cravingsScreen extends StatefulWidget {
    const cravingsScreen ({Key? key}) : super(key: key);
    @override
    DynamicallyCheckboxState createState() => DynamicallyCheckboxState();
}

class DynamicallyCheckboxState extends State{
    Map<String, bool> List = {
        "American" : false,
        "Italian" : false,
        "Indian" : false,
        "Japanese" : false,
        "Mexican" : false,
        "Chinese" : false,
        "Breakfast" : false,
        "Lunch" : false,
        "Dinner" : false,
        "Drinks" : false,
        r"*" : false,
        r"**" : false,
        r"***" : false,
        r"****" : false,
        r"*****" : false,
        "Check to find your restaurant!" : false,
    };
    var holder1 = [];


    @override
        Widget build(BuildContext context){
        return Column(children: <Widget>[
            ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.pink,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    textStyle: const TextStyle(
                        color: Colors.black,
                    ),
                ),
                child: const Text("Select what you are craving"),
            ),
        Expanded(
            child: ListView(
                children: List.keys.map((String key) {
        return CheckboxListTile (
        title: Text(key),
        value: List[key],
        activeColor: Colors.white,
        checkColor: Colors.purple,
        onChanged: (value){
        setState((){
        List[key] = value!;
        if(value == false){
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
        ]);
    }
}
