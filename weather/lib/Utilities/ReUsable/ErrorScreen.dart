import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef void Callback(bool val);

class ErrorScreen extends StatefulWidget {
  Callback? callback;
  ErrorScreen({required this.callback});
  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Something went wrong 😟😟",
            style: GoogleFonts.roboto(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300),
          ),
          TextButton.icon(
              onPressed: () {widget.callback!(false);},
              icon: Icon(Icons.refresh),
              label: Text(
                'Refresh',
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}
