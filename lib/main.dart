import 'package:flutter/material.dart';
import 'package:pagehero/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hero Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.blue.shade100,
      ),
      home: Home(),
    );
  }
}