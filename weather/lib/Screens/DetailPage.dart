import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/DataModels/WeatherReportDataModel.dart';
import 'package:weather/Utilities/ReUsable/CurrentLocationWea.dart';

class DetailsPage extends StatefulWidget {
  String? strLocation;
  Welcome? details;
  DetailsPage({@required this.strLocation, @required this.details});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.strLocation!,
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CurrentLocationWea(
                      details: widget.details,
                      strLocation: widget.strLocation,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
