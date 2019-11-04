import 'package:flutter/material.dart';
import 'package:wutrist/screens/home.dart';

void main() {
  runApp(MyApp()); // Ctrl + .
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
