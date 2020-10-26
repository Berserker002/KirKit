import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kirkit/services/crud.dart';
import 'package:kirkit/views/create_post.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  QuerySnapshot postSnapshot;
  Widget PostList(){
    return Container(
      child: Column(
        children: <Widget>[
          ListView(

          ),
        ],
      ),
    );
  }
  CrudMethods crudMethods = CrudMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    crudMethods.getData().then((result) {
      postSnapshot = result;
    });
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

class PostTile extends StatelessWidget {

  String imgUrl, title;
  PostTile({@required this.imgUrl,@required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Stack(
        children: <Widget>[
          ClipRect(child: Image.network(imgUrl)),
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.black45.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(title),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
