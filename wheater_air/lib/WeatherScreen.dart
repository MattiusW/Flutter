import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:wheater_air/MyHomePage.dart';
import 'package:wheater_air/PermissionScreen.dart';
import 'package:wheater_air/main.dart';
import 'package:intl/src/intl/date_format.dart';
import 'package:intl/date_symbol_data_local.dart';

class WheatherScreen extends StatefulWidget {
  WheatherScreen({this.weather});

  final Weather? weather;

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
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        new Color(0xff6e6cd8),
                        new Color(0xff40a0ef),
                        new Color(0xff77e1ee)
                      ]))),
          Align(
              alignment: FractionalOffset.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 45.0)),
                  Image(image: AssetImage('icons/weather-sunny.png')),
                  Padding(padding: EdgeInsets.only(top: 41.0)),
                  Text(
                    // ${DateFormat.MMMMEEEEd('pl').format(DateTime.now())},
                    "${widget.weather?.weatherDescription}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 14.0,
                            height: 1.2,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                  ),
                  Padding(padding: EdgeInsets.only(top: 12.0)),
                  Text(
                    '${widget.weather?.temperature?.celsius?.floor().toString()}°C',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 64.0,
                            height: 1.2,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                  ),
                  Text(
                    'Odczuwalna ${widget.weather?.tempFeelsLike?.celsius?.floor().toString()}°C',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 14.0,
                            height: 1.2,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Ciśnienie',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 14.0,
                                        height: 1.2,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300)),
                              ),
                              Padding(padding: EdgeInsets.only(top: 2.0)),
                              Text(
                                '${widget.weather?.pressure?.floor()} hpa',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 26.0,
                                        height: 1.2,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700)),
                              )
                            ],
                          ),
                        ),
                        VerticalDivider(
                          width: 48,
                          thickness: 2,
                          color: Colors.white,
                        ),
                        Container(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Wiatr',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 14.0,
                                        height: 1.2,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300)),
                              ),
                              Padding(padding: EdgeInsets.only(top: 2.0)),
                              Text(
                                '${widget.weather?.windSpeed} m/s',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 26.0,
                                        height: 1.2,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 24.0)),
                  if (widget.weather?.rainLastHour != null)
                    Text(
                      "Opady: ${widget.weather?.rainLastHour} mm/1h",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 14.0,
                              height: 1.2,
                              color: Colors.white,
                              fontWeight: FontWeight.w400)),
                    )
                  else
                    Text("Brak wiatru"),
                  Padding(padding: EdgeInsets.only(top: 68.0)),
                ],
              )),
        ],
      ),
    );
  }
}
