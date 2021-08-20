import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/APICalls/GetCalls.dart';
import 'package:weather/DataModels/WeatherReportDataModel.dart';
import 'package:weather/Screens/DetailPage.dart';
import 'package:weather/Screens/LoginPage.dart';
import 'package:weather/Utilities/Constants.dart';
import 'package:weather/Utilities/ReUsable/CurrentLocationAnim.dart';
import 'package:weather/Utilities/ReUsable/CurrentLocationWea.dart';
import 'package:http/http.dart' as http;
import 'package:weather/Utilities/ReUsable/ErrorScreen.dart';
import 'package:weather/Utilities/ReUsable/ListLocAnim.dart';
import 'package:weather/Utilities/ReUsable/ListLocDetails.dart';
import 'package:weather/Utilities/ReUsable/LocationDetails.dart';
import 'package:weather/Utilities/ReUsable/LocationEnabling.dart';
import 'package:weather/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Welcome? details = new Welcome();
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialCall();
  }

  initialCall() async {
    setState(() {
      isLoading = true;
    });
    bool locServ = await LocationPermissions().getServicePerm();
    bool locPerm = await LocationPermissions().getLocPerm();
    print(locServ);
    print(locPerm);
    var co;
    if (!locPerm || !locServ) {
      alert();
    } else {
      co = await LocationPermissions().getLatLong();
    }
    setState(() {
      if (co == null || co!.latitude == null || co!.longitude == null) {
        Coordinates = new Location(
            latitude: listLocation[0]['lat'],
            longitude: listLocation[0]['long'],
            timestamp: DateTime.now());
      } else {
        Coordinates = new Location(
            latitude: co!.latitude,
            longitude: co!.longitude,
            timestamp: DateTime.now());
      }
    });
    List<Placemark> place = await LocationDetails()
        .getAddress(lat: Coordinates!.latitude, long: Coordinates!.longitude);
    setState(() {
      placemarks = place;
    });
    setState(() {
      isLoading = false;
    });
  }

  hometoLogin() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('loginin', 0);
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    setState(() {
      isLoading = false;
    });
  }

  alert() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Alert"),
            content: Text(
                "To get current location weather report,\nGo to setting -> Enable Location and Go to 'Weather' app setting -> Allow Location permission"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Weather",
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        hometoLogin();
                      },
                      icon: Icon(Icons.power_settings_new))
                ],
              ),
            ),
            isLoading
                ? CurrentLocationAnim()
                : Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          FutureBuilder<http.Response>(
                            future: GetCalls().getLocationWeather(
                                Coordinates!.latitude,
                                Coordinates!
                                    .longitude), // function where you call your api
                            builder: (BuildContext context,
                                AsyncSnapshot<http.Response> snapshot) {
                              // AsyncSnapshot<Your object type>
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CurrentLocationAnim();
                              } else {
                                if (snapshot.hasError)
                                  return ErrorScreen(
                                    callback: (v) {
                                      setState(() {});
                                    },
                                  );
                                else {
                                  if (snapshot.hasError)
                                    return ErrorScreen(
                                      callback: (v) {
                                        setState(() {});
                                      },
                                    );
                                  else if (snapshot.data!.statusCode == 200) {
                                    Welcome? subDetails = Welcome.fromJson(
                                        json.decode(snapshot.data!.body));
                                    return CurrentLocationWea(
                                      details: subDetails,
                                      strLocation:
                                          '${placemarks[0].locality}, ${placemarks[0].isoCountryCode}',
                                    );
                                  } else {
                                    return ErrorScreen(
                                      callback: (v) {
                                        setState(() {});
                                      },
                                    );
                                  } // snapshot.data  :- get your object which is pass from your downloadData() function
                                } // snapshot.data  :- get your object which is pass from your downloadData() function
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Other Locations",
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: listLocation.length,
                              itemBuilder: (BuildContext context, int index) {
                                return FutureBuilder<http.Response>(
                                  future: GetCalls().getLocationWeather(
                                      listLocation[index]['lat'],
                                      listLocation[index][
                                          'long']), // function where you call your api
                                  builder: (BuildContext context,
                                      AsyncSnapshot<http.Response> snapshot) {
                                    // AsyncSnapshot<Your object type>
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return ListLocAnim();
                                    } else {
                                      if (snapshot.hasError)
                                        return ErrorScreen(
                                          callback: (v) {
                                            setState(() {});
                                          },
                                        );
                                      else if (snapshot.data!.statusCode ==
                                          200) {
                                        Welcome? subDetails = Welcome.fromJson(
                                            json.decode(snapshot.data!.body));
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailsPage(
                                                            strLocation:
                                                                '${listLocation[index]['city']},${listLocation[index]['country']}',
                                                            details:
                                                                subDetails)));
                                          },
                                          child: ListLocDetails(
                                              strLocation:
                                                  '${listLocation[index]['city']},${listLocation[index]['country']}',
                                              details: subDetails),
                                        );
                                      } else {
                                        return ErrorScreen(
                                          callback: (v) {
                                            setState(() {});
                                          },
                                        );
                                      } // snapshot.data  :- get your object which is pass from your downloadData() function
                                    }
                                  },
                                );
                              })
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
