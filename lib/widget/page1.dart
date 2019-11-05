import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wutrist/models/pageholder_model.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
// Explicit
  List<String> str = ['xx', 'xcs', 'yy']; //example
  List<PageHolderModel> pageHolderModel = [];

// Method
  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    String urlAPI = 'https://jsonplaceholder.typicode.com/posts';
    Response response = await get(urlAPI);
    var result = json.decode(response.body);
    print('result $result');

    for (var map in result) {
      PageHolderModel holderModel = PageHolderModel.fromJson(map);
      String title = holderModel.title;
      print('title = $title');
      setState(() {
        pageHolderModel.add(holderModel);
      });
    }
  }

  Widget showTite(int index) {
    return Text(pageHolderModel[index].title);
  }

  Widget showListView(int index) {
    return Container(decoration: index%2 == 0 ? BoxDecoration(color: Colors.blue):BoxDecoration(color: Colors.blue[100]),
      child: Column(
        children: <Widget>[showTite(index),],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pageHolderModel.length,
      itemBuilder: (BuildContext context, int index) {
        return showListView(index);//Text(pageHolderModel[index].title);
      },
    );
  }
}
