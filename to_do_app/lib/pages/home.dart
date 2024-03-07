import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            'Test',
            style: TextStyle(color: Colors.red, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
