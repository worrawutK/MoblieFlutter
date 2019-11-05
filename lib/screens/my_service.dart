import 'package:flutter/material.dart';
import 'package:wutrist/models/user_model.dart';
import 'package:wutrist/widget/page1.dart';
import 'package:wutrist/widget/page2.dart';
import 'package:wutrist/widget/page3.dart';

class MyService extends StatefulWidget {
  final UserModel userModel;
  MyService({Key key, this.userModel}) : super(key: key);
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  //Explicit
  String loginString = '';
  UserModel myUserModel;
  Widget currentWidget = Page1();
  // Method
  @override
  void initState() {
    super.initState();
    myUserModel = widget.userModel;
    String name = myUserModel.name;
    String sername = myUserModel.surName;
    loginString = '$name  $sername';
  }
  Widget menuPage1(){
    return ListTile(
      leading: Icon(Icons.touch_app,size: 36.0,color: Colors.green,),
      title: Text('Page1'),
      subtitle: Text('คำอธิบาย Page 1'),
      onTap: (){
        setState(() {
            currentWidget = Page1();
        });

        Navigator.of(context).pop();
      },
    );
  }
 Widget menuPage2(){
    return ListTile(
      leading: Icon(Icons.touch_app,size: 36.0,color: Colors.green,),
      title: Text('Page2'),
      subtitle: Text('คำอธิบาย Page 2'),
      onTap: (){
        setState(() {
           currentWidget = Page2();
        });
         Navigator.of(context).pop();
      },
    );
  }
   Widget menuPage3(){
    return ListTile(
      leading: Icon(Icons.touch_app,size: 36.0,color: Colors.green,),
      title: Text('Page3'),
      subtitle: Text('คำอธิบาย Page 3'),
      onTap: (){
        setState(() {
            currentWidget = Page3();
        });
        
         Navigator.of(context).pop();
      },
    );
  }

  Widget showLogin() {
    return Text('Login by $loginString');
  }

  Widget showAppName() {
    return Text('WUT Rist');
  }

  Widget showLogo() {
    return Container(
      width: 80.0,
      height: 80.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showHeadDrawer() {
    return DrawerHeader(
      child: Column(
        children: <Widget>[showLogo(),showAppName(),showLogin()],
      ),
    );
  }

  Widget showDrawe() {
    return Drawer(
      child: ListView(
        children: <Widget>[showHeadDrawer(),menuPage1(),Divider(),menuPage2(),Divider(),menuPage3()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My service'),
      ),
     // body: Text('body'),
      body: currentWidget,
      drawer: showDrawe(),
    );
  }
}
