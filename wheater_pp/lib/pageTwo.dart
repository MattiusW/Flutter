import 'package:flutter/material.dart';

class MySecondWidget extends StatefulWidget {
  const MySecondWidget({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyFirstState();
  }
}

class _MyFirstState extends State<MySecondWidget> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter *= 2;
      if (_counter >= 32) {
        Navigator.pop(context, _counter);
      }
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
                color: Colors.amber,
                child: Text("You have pushed the button this many times")),
          ),
          Text('$_counter')
        ],
      )),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
