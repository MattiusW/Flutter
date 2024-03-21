import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/weather.dart';
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

  @override
  void initState() {
    super.initState();
    if (perrmisionDenied()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PermissionScreen()));
    } else {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        executeOnceAfterBuild();
      });
    }
  }

  bool perrmisionDenied() {
    return false;
  }

  void executeOnceAfterBuild() async {
    WeatherFactory wf = new WeatherFactory('630b030ad252cf221335e58564d617ba',
        language: Language.POLISH);
    Weather w = await wf.currentWeatherByCityName('Warszawa');
    log(w.toJson().toString());
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(weather: w)));
  }
}
