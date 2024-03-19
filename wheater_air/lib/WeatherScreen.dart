import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheater_air/MyHomePage.dart';
import 'package:wheater_air/PermissionScreen.dart';
import 'package:wheater_air/main.dart';

class WheatherScreen extends StatefulWidget {
  @override
  State<WheatherScreen> createState() => _WheatherScreenState();
}

class _WheatherScreenState extends State<WheatherScreen> {
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
                      colors: [new Color(0xff6e6cd8), new Color(0xff77e1ee)]))),
          Align(
              alignment: FractionalOffset.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 45.0)),
                  Image(image: AssetImage('icons/weather-sunny.png')),
                  Padding(padding: EdgeInsets.only(top: 41.0)),
                  Text("Poniedziałek 31.03, 18:00 słonecznie"),
                  Padding(padding: EdgeInsets.only(top: 12.0)),
                  Text('14°C'),
                  Text('Odczuwalna 13°C'),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Ciśnienie'),
                              Padding(padding: EdgeInsets.only(top: 2.0)),
                              Text('102- hPa')
                            ],
                          ),
                        ),
                        VerticalDivider(
                          width: 48,
                          thickness: 2,
                        ),
                        Container(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Wiatr'),
                              Padding(padding: EdgeInsets.only(top: 2.0)),
                              Text('16 km/h')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 24.0)),
                  Text("Opady: 0,1 mm/12h"),
                  Padding(padding: EdgeInsets.only(top: 68.0)),
                ],
              )),
        ],
      ),
    );
  }
}
