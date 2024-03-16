import 'dart:js';

import 'package:flutter/material.dart';
import 'package:wheater_pp/pageTwo.dart';

class MyFirstWidget extends StatefulWidget {
  const MyFirstWidget({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyFirstState();
  }
}

class _MyFirstState extends State<MyFirstWidget> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter *= 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(100.0),
            child: Container(
                color: Colors.amber, child: Text("You have returned vaule")),
          ),
          Text('$_counter')
        ],
      )),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) =>
                      new MySecondWidget(title: 'count to 32')));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
