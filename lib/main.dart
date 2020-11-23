import 'package:flutter/material.dart';
import './home_screen.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        buttonColor: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('interest Calculator'),
        ),
        body: HomeScreen(),
      ),
    );
  }
}
