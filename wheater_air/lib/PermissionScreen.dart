import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheater_air/MyHomePage.dart';
import 'package:wheater_air/SplashScreen.dart';
import 'package:wheater_air/main.dart';

class PermissionScreen extends StatefulWidget {
  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
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
                  Image(image: AssetImage('icons/hand-wave.png')),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text("Witaj!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 52.0,
                        color: Colors.white,
                      ))),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  Text(
                      'Aplikacja ${Strings.appTitle} potrzebuje do działania \n przybliżonej lokalizacji urządzenia',
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
                  margin: EdgeInsets.only(left: 12.0, right: 12.0),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.only(top: 12.0, bottom: 12.0))),
                          onPressed: () async {
                            LocationPermission permission =
                                await Geolocator.requestPermission();
                            if (permission == LocationPermission.always ||
                                permission == LocationPermission.whileInUse) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SplashScreen()));
                            }
                          },
                          child: Text('Zgoda!',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black)))))),
        ],
      ),
    );
  }
}
