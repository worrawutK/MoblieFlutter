import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit
  String resultCode = '';
  // Method
  Widget authenButton() {
    return RaisedButton(
      color: Colors.orange[300],
      child: Text(
        'Authentication',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('You Click Authen');
        readQRcode();
      },
    );
  }
//async await
  Future<void> readQRcode() async {
    try {
      resultCode = await BarcodeScanner.scan();
      print('resultCode = $resultCode');
      getUserWhereResultCode();
    } catch (e) {}
  }
 Future<void>getUserWhereResultCode() async{
   try {
     String urlAPI = 'http://10.28.50.26/getUserWhereResultWut.php?isAdd=true&ResultCode=$resultCode';
     Response response  = await get(urlAPI);
    
     var result = json.decode(response.body);
      print('result = $result');
   } catch (e) {
   }
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
              gradient: RadialGradient(
                  colors: [Colors.white, Colors.blue,Colors.yellow],
                  radius: 1.0,
                  center: Alignment.topRight,
                  tileMode: TileMode.clamp)),
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
