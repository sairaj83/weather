import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: DefaultTextStyle(
        style: GoogleFonts.roboto(
            fontSize: 30.0, color: Colors.amber, fontWeight: FontWeight.bold),
        child: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText('Weather'),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
      )),
    );
  }
}
