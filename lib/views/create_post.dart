import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:kirkit/services/crud.dart';
import 'package:random_string/random_string.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  bool isLoading = false;
  CrudMethods crudMethods = CrudMethods();
  String title;
  String content;
  File selectedImage;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  uploadPost() async{
    if(selectedImage != null) {
      setState(() {
        isLoading = true;
      });
      StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child("images").child("${randomAlphaNumeric(9)}.jpg");
      final StorageUploadTask task = firebaseStorageRef.putFile(selectedImage);
      var downloadUrl = await(await task.onComplete).ref.getDownloadURL();
      Map<String, String> postData;
      postData = {
      "imageUrl": downloadUrl,
      "title" : title,
      "content": content,
      };
      crudMethods.addData(postData).then((result) {
        Navigator.pop(context);
      });
    } else {
      print('Image is not selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Kir', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),),
            Text('Kit', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: () {
                uploadPost();
              },
              child: Icon(Icons.file_upload),
            ),
          ),
        ],
      ),
      body: isLoading
          ? Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      )
          : Container(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10,),
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: selectedImage == null ? Container(
                height: 150,
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10),),
                child: Icon(Icons.add_a_photo, color: Colors.black,),
              ) : Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(selectedImage, fit: BoxFit.cover,
                      ),
                  ),
                  height: 150,
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: 'Title'),
                    onChanged: (val) {
                      title = val;
                    },
                  ),
                  SizedBox(height: 5.0,),
                  TextField(
                    decoration: InputDecoration(hintText: 'Content'),
                    onChanged: (val) {
                      content = val;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
