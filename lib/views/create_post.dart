import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  String title;
  String content;

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
            child: Icon(Icons.file_upload),
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10,),
            Container(
              height: 150,
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10),),
              child: Icon(Icons.add_a_photo, color: Colors.black,),
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
