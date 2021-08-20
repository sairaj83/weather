import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather/DataModels/WeatherReportDataModel.dart';
import 'package:weather/Utilities/Constants.dart';

class CurrentLocationWea extends StatefulWidget {
  Welcome? details;
  String? strLocation;
  CurrentLocationWea({@required this.details, @required this.strLocation});
  @override
  _CurrentLocationWeaState createState() => _CurrentLocationWeaState();
}

class _CurrentLocationWeaState extends State<CurrentLocationWea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.height * 0.25,
                  child: Center(
                      child: Text(
                    widget.strLocation!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.height * 0.25,
                  child: Center(
                      child: Text(
                    '${widget.details!.weather![0].main}',
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.height * 0.25,
                  child: Center(
                      child: RichText(
                          text: TextSpan(children: [
                    TextSpan(
                      text: 'Clouds: ',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w200),
                    ),
                    TextSpan(
                      text: '${widget.details!.clouds!.all}%',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ]))),
                ),
              ],
            ),
            Container(
              color: Colors.blue[200],
              height: 100,
              width: MediaQuery.of(context).size.height * 0.15,
              child: Image.network(
                  'http://openweathermap.org/img/wn/${widget.details!.weather![0].icon}@2x.png'),
            )
          ],
        ),

//Temperature
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 0.5,
              width: MediaQuery.of(context).size.height * 0.30,
              color: Colors.black,
            ),
            Text(
              'Temperature',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),

        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.height * 0.20,
                  child: Center(
                      child: RichText(
                          text: TextSpan(children: [
                    TextSpan(
                      text: 'Temp: ',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                    TextSpan(
                      text: '${widget.details!.main!.temp}  °C',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ]))),
                ),
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.height * 0.20,
                  child: Center(
                      child: RichText(
                          text: TextSpan(children: [
                    TextSpan(
                      text: 'Feels like: ',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                    TextSpan(
                      text: '${widget.details!.main!.feelsLike}  °C',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ]))),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.height * 0.20,
                  child: Center(
                      child: RichText(
                          text: TextSpan(children: [
                    TextSpan(
                      text: 'Temp min: ',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                    TextSpan(
                      text: '${widget.details!.main!.tempMin}  °C',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ]))),
                ),
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.height * 0.20,
                  child: Center(
                      child: RichText(
                          text: TextSpan(children: [
                    TextSpan(
                      text: 'Temp max: ',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                    TextSpan(
                      text: '${widget.details!.main!.tempMax}  °C',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ]))),
                ),
              ],
            )
          ],
        ),

        SizedBox(
          height: 5,
        ),
        //Pressure,Humidity
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 0.5,
              width: MediaQuery.of(context).size.height * 0.45,
              color: Colors.black,
            ),
          ],
        ),

        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 25,
              width: MediaQuery.of(context).size.height * 0.20,
              child: Center(
                  child: RichText(
                      text: TextSpan(children: [
                TextSpan(
                  text: 'Pressure: ',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: '${widget.details!.main!.pressure} hPa',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ]))),
            ),
            Container(
              height: 25,
              width: MediaQuery.of(context).size.height * 0.20,
              child: Center(
                  child: RichText(
                      text: TextSpan(children: [
                TextSpan(
                  text: 'Humid: ',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: '${widget.details!.main!.humidity} %',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ]))),
            ),
          ],
        ),

        SizedBox(
          height: 5,
        ),

        //Levels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 0.5,
              width: MediaQuery.of(context).size.height * 0.35,
              color: Colors.black,
            ),
            Text(
              'Levels',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 25,
              width: MediaQuery.of(context).size.height * 0.20,
              child: Center(
                  child: RichText(
                      text: TextSpan(children: [
                TextSpan(
                  text: 'Sea: ',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: '${widget.details!.main!.seaLevel} hPa',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ]))),
            ),
            Container(
              height: 25,
              width: MediaQuery.of(context).size.height * 0.20,
              child: Center(
                  child: RichText(
                      text: TextSpan(children: [
                TextSpan(
                  text: 'Ground: ',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: '${widget.details!.main!.grndLevel} hPa',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ]))),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),

        //Wind
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Wind',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            Container(
              height: 0.5,
              width: MediaQuery.of(context).size.height * 0.35,
              color: Colors.black,
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 25,
              width: MediaQuery.of(context).size.height * 0.20,
              child: Center(
                  child: RichText(
                      text: TextSpan(children: [
                TextSpan(
                  text: 'Speed: ',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: '${widget.details!.wind!.speed} meter/sec',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ]))),
            ),
            Container(
              height: 25,
              width: MediaQuery.of(context).size.height * 0.20,
              child: Center(
                  child: RichText(
                      text: TextSpan(children: [
                TextSpan(
                  text: 'Degree: ',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: '${widget.details!.wind!.deg}',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ]))),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        //Day light
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Day Light',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            Container(
              height: 0.5,
              width: MediaQuery.of(context).size.height * 0.35,
              color: Colors.black,
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.height * 0.20,
                  child: Center(
                    child: Center(
                      child: Text(
                        '${DateFormat("hh:mm:ss a").format(DateTime.fromMillisecondsSinceEpoch(widget.details!.sys!.sunrise! * 1000))}',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.height * 0.20,
                  child: Center(
                      child: Text(
                    'Sun raise',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  )),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.height * 0.20,
                  child: Center(
                    child: Text(
                      '${DateFormat("hh:mm:ss a").format(DateTime.fromMillisecondsSinceEpoch(widget.details!.sys!.sunset! * 1000))}',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.height * 0.20,
                  child: Center(
                    child: Text(
                      'Sun Set',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
