import 'package:flutter/material.dart';
import 'package:kirkit/views/home.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: HomePage()
    );
  }
}
