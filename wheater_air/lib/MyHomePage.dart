import 'package:flutter/material.dart';
import 'package:wheater_air/AirScreen.dart';
import 'package:wheater_air/WeatherScreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 0;
  var screens = [
    AirScreen(),
    WheatherScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.masks_outlined), label: "Powietrze"),
            BottomNavigationBarItem(
                icon: Icon(Icons.wb_cloudy_outlined), label: "Pogoda")
          ]),
    );
  }
}
