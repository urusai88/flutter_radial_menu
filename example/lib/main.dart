import 'package:flutter/material.dart';
import 'package:flutter_radial_menu/flutter_radial_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          child: RadialMenu(children: <Widget>[
            Container(color: Colors.red, width: 50, height: 50),
            Container(color: Colors.yellow, width: 50, height: 50),
            Container(color: Colors.green, width: 50, height: 50),
            Container(color: Colors.blue, width: 50, height: 50),
            Container(color: Colors.black, width: 50, height: 50),
            Container(color: Colors.purple, width: 50, height: 50),
          ]),
        ),
      ),
    );
  }
}
