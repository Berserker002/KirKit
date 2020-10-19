import 'package:flutter/material.dart';
import 'package:kirkit/views/create_post.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      ),
      body: Container(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePost()));
                }),
          ],
        ),
      ),
    );
  }
}
