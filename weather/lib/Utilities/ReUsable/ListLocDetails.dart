import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/DataModels/WeatherReportDataModel.dart';

class ListLocDetails extends StatefulWidget {
  String? strLocation;
  Welcome? details;
  ListLocDetails({@required this.strLocation, @required this.details});
  @override
  _ListLocDetailsState createState() => _ListLocDetailsState();
}

class _ListLocDetailsState extends State<ListLocDetails> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.white,
              height: 25,
              width: MediaQuery.of(context).size.height * 0.20,
              child: Center(
                  child: RichText(
                      text: TextSpan(children: [
                TextSpan(
                  text: '${widget.strLocation}',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ]))),
            ),
            Container(
              height: 25,
              width: MediaQuery.of(context).size.height * 0.10,
              child: Center(
                  child: RichText(
                      text: TextSpan(children: [
                TextSpan(
                  text: '${widget.details!.main!.temp} °C',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ]))),
            ),
            Container(
              height: 40,
              width: 40,
              child: Image.network(
                'http://openweathermap.org/img/wn/${widget.details!.weather![0].icon}@2x.png',
                height: 40,
                width: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
