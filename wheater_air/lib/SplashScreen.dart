import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheater_air/MyHomePage.dart';
import 'package:wheater_air/PermissionScreen.dart';
import 'package:wheater_air/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    new Future.delayed(
        const Duration(seconds: 7),
        () => {
              if (havePermission())
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PermissionScreen()))
                }
              else
                {
                  //Todo load data
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()))
                }
            });

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
                      colors: [new Color(0xff6671e5), new Color(0xff4852d9)]))),
          Align(
              alignment: FractionalOffset.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage('icons/cloud-sun.png')),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  Text(Strings.appTitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 42.0,
                        color: Colors.white,
                      ))),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Text('Aplikacja do monitorowania \n czystości powietrza',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
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
                            color: Colors.white,
                          )))))
        ],
      ),
    );
  }

  bool havePermission() {
    return true;
  }
}
