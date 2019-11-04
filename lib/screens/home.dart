import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit

  // Method
  Widget authenButton() {
    return RaisedButton(
      color: Colors.orange[300],
      child: Text(
        'Authentication',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Wut Rist',
      style: TextStyle(
        color: Colors.red.shade900,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: Container(decoration: BoxDecoration(color: Colors.blue),
        child: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(colors: [Colors.white, Colors.blue],radius: 1.0,center: Alignment.topRight,tileMode: TileMode.clamp)),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[showLogo(), showAppName(), authenButton()],
            ),
          ),
        ),
      ),
    );
  }
}
