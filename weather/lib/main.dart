import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/Screens/Homepage.dart';
import 'package:weather/Screens/LoginPage.dart';
import 'package:weather/Utilities/Constants.dart';
import 'package:weather/Utilities/ReUsable/LocationDetails.dart';
import 'package:weather/Utilities/ReUsable/LocationEnabling.dart';
import 'package:weather/Utilities/Spalsh.dart';

var classLoad;
Location? Coordinates;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      classLoad = SplashScreen();
    });
    Future.delayed(Duration(milliseconds: 3000)).then((value) {
      initialcall();
    });
  }

  initialcall() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if (preferences.getInt('loginin') == 1) {
        classLoad = HomePage();
      } else {
        classLoad = Login();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return classLoad;
  }
}
