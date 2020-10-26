import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class CrudMethods {
  Future<void> addData (blogData) async{
    await Firebase.initializeApp();
    FirebaseFirestore.instance.collection("posts").add(blogData).then((value) => print("Data Added")).catchError((e) {
      print("Cannot add Data :$e");
    });
  }

  getData() async{
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance.collection("posts").get();
  }
}