import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheater_air/MyHomePage.dart';
import 'package:wheater_air/PermissionScreen.dart';
import 'package:wheater_air/main.dart';

class AirScreen extends StatefulWidget {
  @override
  State<AirScreen> createState() => _AirScreenState();
}

class _AirScreenState extends State<AirScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  color: new Color(0xffffffff),
                  gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        new Color(0xff4acf8c),
                        Color.fromARGB(255, 150, 235, 186)
                      ]))),
          Align(
              alignment: FractionalOffset.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                      image: AssetImage('icons/cloud-sun.png'),
                      color: Colors.black),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  Text(Strings.appTitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 42.0,
                        color: Colors.black,
                      ))),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Text('Powietrze',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      )))
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 35,
              child: Container(
                  alignment: Alignment.center,
                  child: Text("Przewiewam dane...",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w300,
                          textStyle: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          )))))
        ],
      ),
    );
  }

  bool havePermission() {
    return true;
  }
}
