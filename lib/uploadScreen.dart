import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:idk_what_to_eat_test/photoStorage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Im;
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';

class uploadScreen extends StatefulWidget {
  const uploadScreen({Key? key}) : super(key: key);

  @override
  State<uploadScreen> createState() => _uploadScreenState();
}

class _uploadScreenState extends State<uploadScreen> {

  File? file;
  String postId = Uuid().v4();
  final TextEditingController _captionEditingController = TextEditingController();
  final TextEditingController _restaurantEditingController = TextEditingController();
  final storageRef = FirebaseStorage.instance.ref();
  final postsRef = FirebaseFirestore.instance.collection('posts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.15,
              color: Colors.grey,
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    file = await pickImage();
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
            const SizedBox(height: 5,),
            TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(250),
              ],
              controller: _restaurantEditingController,
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
            const SizedBox(height: 100.0),
            GestureDetector(
              onTap: () async {
                await compressImage();
                String mediaUrl = await uploadImage(file);
                createPostInFirestore(mediaUrl: mediaUrl,
                resturantName: _restaurantEditingController.text,
                caption: _captionEditingController.text);
                _captionEditingController.clear();
                _restaurantEditingController.clear();
                file = null;
                postId = Uuid().v4();
                print("uploaded");
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
  compressImage() async{
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image? imageFile= Im.decodeImage(file!.readAsBytesSync());
    final compressedImageFile = File('$path/img_$postId.jpg')..writeAsBytesSync(Im.encodeJpg(imageFile!, quality: 85));
    file = compressedImageFile;
  }

  Future<String> uploadImage(imageFile) async{
    UploadTask uploadTask = storageRef.child("post_$postId.jpg").putFile(imageFile);
    TaskSnapshot storageSanp = await uploadTask;
    String downloadUrl = await storageSanp.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<File?>pickImage() async{
    XFile? image = (await ImagePicker().pickImage(source: ImageSource.gallery));
    final File? file = File(image!.path);
    print("got file");
    return file;
  }

  createPostInFirestore({required String mediaUrl, required String resturantName, required String caption}){
    postsRef.doc(postId).set({
      "postId": postId,
      "caption": caption,
      "restaurantName": resturantName,
      "mediaUrl": mediaUrl,
      "timestamp": Timestamp.fromDate(DateTime.now()),});
  }
}

