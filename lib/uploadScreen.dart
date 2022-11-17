import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idk_what_to_eat_test/myUser.dart';
import 'package:image_picker/image_picker.dart';

class uploadScreen extends StatefulWidget {
  const uploadScreen({Key? key});

  @override
  State<uploadScreen> createState() => _uploadScreenState();
}

class _uploadScreenState extends State<uploadScreen> {

  final TextEditingController _captionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 700.0,
              color: Colors.grey,
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    File results = (await ImagePicker().pickImage(source: ImageSource.gallery,
                    maxHeight: 675,
                    maxWidth: 960)) as File;
                    if (results==null){
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("No file selected")));
                      return null;
                    }
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: const Text(
                    'Choose Image',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),

                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(250),
              ],
              controller: _captionEditingController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Caption',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,
                    color: Colors.blueAccent)
                  ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,
                        color: Colors.lightBlueAccent)
                )
              ),
            ),
            const SizedBox(height:20.0),
            TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(250),
              ],
              controller: _captionEditingController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Restaurant Name',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3,
                          color: Colors.blueAccent)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3,
                          color: Colors.lightBlueAccent)
                  )
              ),
            ),
            const SizedBox(height: 500.0),
            GestureDetector(
              onTap: () {handleSubmit();
              },
              child: Container(
                color: Colors.blueAccent,
                width: 165.0,
                height:50.0,
                child: const Center(
                  child: Text(
                    'Upload',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    )
                  )
                )
              ),
            )
          ]
        ),
      ),
    );
  }
  handleSubmit(){

  }
}

