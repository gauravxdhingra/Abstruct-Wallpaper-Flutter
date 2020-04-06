import 'package:flutter/material.dart';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Abstruct',
      home: Fetch(),
    );
  }
}

class Fetch extends StatefulWidget {
  @override
  _FetchState createState() => _FetchState();
}

class _FetchState extends State<Fetch> {
  var n = 0;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  //List<String> list = List();
  String img = "";
  String txt = "";
  
  void _getData() async {
    final response =
        await http.get('https://wallpaperscraft.com/all/1080x1920/');
    dom.Document document = parser.parse(response.body);
    //final elements = document.getElementsByTagName('h1');

// 1 to 15
    img = document
        .getElementsByTagName('img')[n + 1]
        .attributes['src']
        .replaceAll("168x300.jpg", "1080x1920.jpg");
    //txt = document.getElementsByTagName('h1')[0].innerHtml.replaceAll("<span>", "").replaceAll("<"+"/"+"span>", "");
    // txt = document
    //     .getElementsByTagName('span')[n]
    //     .getElementsByClassName('wallpapers__info')[1]
    //     .innerHtml
    //     .replaceAll("&nbsp;", "");
    // print(txt);

    setState(() {
      // print(txt);
      print(img);

      /*     list = elements
          .map((element) =>
       element.getElementsByTagName("img")[0].attributes['src'])
          .toList();*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _getData();
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              // Image.network(img, height: 300, width: 300),
              Text(img),
              // txt != null ?
              // Text(txt),
              // : Text("Loading..."),
            ],
          ),
        ),
      ),
    );
  }
}
