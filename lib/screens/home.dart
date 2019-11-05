import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wutrist/models/user_model.dart';
import 'package:wutrist/screens/my_alert.dart';
import 'package:wutrist/screens/my_service.dart';

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
      color: Colors.blue[600],
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

  Future<void> getUserWhereResultCode() async {
    try {
      String urlAPI =
          'http://10.28.50.26/getUserWhereResultWut.php?isAdd=true&ResultCode=$resultCode';
      Response response = await get(urlAPI);

      var result = json.decode(response.body);
      print('result = $result');
      if (result.toString() == 'null') {
         print('test1');
        normalDialog('Result False', 'No $resultCode in my database', context);
      } else {
         print('test2');
        for (var map in result) {
          UserModel userModel = UserModel.fromJSON(map);
          MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context){return MyService(userModel: userModel,);});
          Navigator.of(context).pushAndRemoveUntil(materialPageRoute, (Route<dynamic>route){return false;});
        }
      }
       print('test3');
    } catch (e) { print('test4');}
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
        color: Colors.white,
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
                  colors: [
                Colors.white,
                Colors.yellow,
                Colors.orange,
                Colors.red
              ],
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
